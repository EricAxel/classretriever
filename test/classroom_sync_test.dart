import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:class_retriever_published_version_in_stores_nov_2025/backend/classroom_sync.dart';

Map<String, dynamic> work(
  String courseId,
  String id, {
  String? updateTime,
  Map<String, dynamic>? dueDate,
  String state = 'CREATED',
  String fingerprint = 'fp',
}) =>
    {
      'courseId': courseId,
      'id': id,
      'title': 'Tarea $id',
      if (updateTime != null) 'updateTime': updateTime,
      if (dueDate != null) 'dueDate': dueDate,
      'studentSubmission': {'id': 'sub-$id', 'state': state},
      'fingerprint': fingerprint,
    };

String daysAgo(int days) =>
    DateTime.now().toUtc().subtract(Duration(days: days)).toIso8601String();

void main() {
  group('mergeSyncResponse', () {
    test('agrega, reemplaza y elimina según la respuesta', () {
      final local = LocalClassroomData(
        courses: [
          {'id': 'c1', 'name': 'Math'}
        ],
        items: {
          'c1/w1': work('c1', 'w1', updateTime: daysAgo(1), fingerprint: 'old'),
          'c1/w2': work('c1', 'w2', updateTime: daysAgo(1)),
        },
      );
      final merged = mergeSyncResponse(local, {
        'courses': [
          {'id': 'c1', 'name': 'Math', 'ok': true}
        ],
        'changed': [work('c1', 'w1', updateTime: daysAgo(0), fingerprint: 'new')],
        'removed': ['c1/w2'],
      })!;
      expect(merged.items.keys, ['c1/w1']);
      expect(merged.known, {'c1/w1': 'new'});
    });

    test('un curso con error conserva su nombre y sus tareas', () {
      final local = LocalClassroomData(
        courses: [
          {'id': 'c2', 'name': 'Art'}
        ],
        items: {'c2/w5': work('c2', 'w5', updateTime: daysAgo(1))},
      );
      final merged = mergeSyncResponse(local, {
        'courses': [
          {'id': 'c2', 'name': '', 'ok': false, 'errorCode': 403}
        ],
        'changed': [],
        'removed': [],
      })!;
      expect(merged.courses.single['name'], 'Art');
      expect(merged.items.containsKey('c2/w5'), isTrue);
    });

    test('una respuesta con forma inesperada no toca nada', () {
      final local = LocalClassroomData.empty();
      expect(mergeSyncResponse(local, null), isNull);
      expect(mergeSyncResponse(local, 'texto'), isNull);
      expect(mergeSyncResponse(local, {'courses': [], 'changed': 'x', 'removed': []}), isNull);
    });

    test('ignora elementos dañados dentro de la respuesta', () {
      final merged = mergeSyncResponse(LocalClassroomData.empty(), {
        'courses': [
          'x',
          {'id': 'c1', 'name': 'Math'}
        ],
        'changed': [
          5,
          {'id': 'w1'},
          work('c1', 'w2', updateTime: daysAgo(1))
        ],
        'removed': [7],
      })!;
      expect(merged.courses.length, 1);
      expect(merged.items.keys, ['c1/w2']);
    });
  });

  group('buildWorkList (mismas funciones de siempre)', () {
    final data = LocalClassroomData(
      courses: [
        {'id': 'c1', 'name': 'Math'},
        {'id': 'c2', 'name': 'Art'},
      ],
      items: {
        'c1/w1': work('c1', 'w1',
            updateTime: daysAgo(3),
            dueDate: {'year': 2026, 'month': 10, 'day': 20},
            state: 'TURNED_IN'),
        'c1/old': work('c1', 'old', updateTime: daysAgo(70)),
        'c2/w2': work('c2', 'w2', updateTime: daysAgo(1)),
        'c2/bad': work('c2', 'bad', updateTime: 'no-es-fecha'),
        'c9/w9': work('c9', 'w9', updateTime: daysAgo(1)),
      },
    );

    test('aplica el filtro de semanas y el nombre del curso', () {
      final list = buildWorkList(data, 4);
      expect(list.map((w) => w.id), ['w1', 'w2']);
      expect(list.map((w) => w.coursename), ['Math', 'Art']);
    });

    test('llena entrega, estado y fecha como antes', () {
      final w1 = buildWorkList(data, 4).first;
      expect(w1.studentSubmissionId, 'sub-w1');
      expect(w1.actualStatus, 'TURNED_IN');
      expect(w1.datetime, DateTime(2026, 10, 20));
    });

    test('sin fecha de entrega usa la misma fecha que creatDateTime (1950)', () {
      final w2 = buildWorkList(data, 4).last;
      expect(w2.datetime, DateTime(1950, 1, 1));
    });

    test('un rango mayor incluye tareas más antiguas', () {
      expect(buildWorkList(data, 12).map((w) => w.id), ['w1', 'old', 'w2']);
    });
  });

  group('copia local', () {
    test('guarda y lee la misma información', () async {
      SharedPreferences.setMockInitialValues({});
      final data = LocalClassroomData(
        courses: [
          {'id': 'c1', 'name': 'Math'}
        ],
        items: {'c1/w1': work('c1', 'w1', updateTime: daysAgo(1))},
      );
      await saveLocal('s1', data);
      final read = await loadLocal('s1');
      expect(read!.known, {'c1/w1': 'fp'});
    });

    test('una copia dañada se borra y se descarga todo de nuevo', () async {
      SharedPreferences.setMockInitialValues({'cr_sync_v1_s1': '{dañado'});
      expect(await loadLocal('s1'), isNull);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('cr_sync_v1_s1'), isFalse);
    });

    test('una copia con versión desconocida se descarta', () async {
      SharedPreferences.setMockInitialValues({
        'cr_sync_v1_s1': jsonEncode({'v': 99, 'courses': [], 'items': {}})
      });
      expect(await loadLocal('s1'), isNull);
    });

    test('quitar a un estudiante borra su copia', () async {
      SharedPreferences.setMockInitialValues({'cr_sync_v1_s1': '{}'});
      await deleteLocal('s1');
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.containsKey('cr_sync_v1_s1'), isFalse);
    });
  });
}
