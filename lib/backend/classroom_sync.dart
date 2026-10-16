// Copia local de las tareas de Google Classroom y sincronización con Firebase.
//
// Los datos de Classroom viven solo en este teléfono. La función `sync` del
// servidor compara lo que hay aquí con Google y devuelve solo lo que cambió.
// La lista final se arma con las mismas funciones de siempre:
// setCourseName, joinAssigments y creatDateTime.

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_util.dart';

const _kStoragePrefix = 'cr_sync_v1_';

/// Estudiante abierto en Student Work y si ya se sincronizó al abrirlo.
String? currentStudentId;
bool _syncedOnOpen = false;

class LocalClassroomData {
  LocalClassroomData({required this.courses, required this.items});

  /// Cursos en el orden de Google: [{id, name}].
  final List<Map<String, dynamic>> courses;

  /// Tareas por clave "courseId/courseWorkId", con la forma JSON de Google
  /// más `studentSubmission` y `fingerprint`.
  final Map<String, Map<String, dynamic>> items;

  bool get isEmpty => courses.isEmpty && items.isEmpty;

  Map<String, String> get known => {
        for (final entry in items.entries)
          if (entry.value['fingerprint'] is String)
            entry.key: entry.value['fingerprint'] as String,
      };

  Map<String, dynamic> toJson() => {'v': 1, 'courses': courses, 'items': items};

  static LocalClassroomData empty() => LocalClassroomData(courses: [], items: {});

  /// Devuelve null si el contenido no tiene la forma esperada.
  static LocalClassroomData? fromJson(dynamic data) {
    if (data is! Map || data['v'] != 1) return null;
    final rawCourses = data['courses'];
    final rawItems = data['items'];
    if (rawCourses is! List || rawItems is! Map) return null;

    final courses = <Map<String, dynamic>>[];
    for (final course in rawCourses) {
      if (course is Map && course['id'] is String) {
        courses.add({'id': course['id'], 'name': course['name'] is String ? course['name'] : ''});
      }
    }
    final items = <String, Map<String, dynamic>>{};
    for (final entry in rawItems.entries) {
      if (entry.key is String && entry.value is Map) {
        items[entry.key as String] = Map<String, dynamic>.from(entry.value as Map);
      }
    }
    return LocalClassroomData(courses: courses, items: items);
  }
}

String _storageKey(String studentId) => '$_kStoragePrefix$studentId';

/// Lee la copia local. Si está dañada, la borra y devuelve null.
Future<LocalClassroomData?> loadLocal(String studentId) async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(_storageKey(studentId));
  if (raw == null) return null;
  try {
    final data = LocalClassroomData.fromJson(jsonDecode(raw));
    if (data != null) return data;
  } catch (_) {}
  await prefs.remove(_storageKey(studentId));
  return null;
}

Future<void> saveLocal(String studentId, LocalClassroomData data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_storageKey(studentId), jsonEncode(data.toJson()));
}

Future<void> deleteLocal(String studentId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_storageKey(studentId));
}

/// Mezcla la respuesta del servidor con la copia local.
/// Devuelve null si la respuesta no tiene la forma esperada.
LocalClassroomData? mergeSyncResponse(LocalClassroomData local, dynamic body) {
  if (body is! Map) return null;
  final courses = body['courses'];
  final changed = body['changed'];
  final removed = body['removed'];
  if (courses is! List || changed is! List || removed is! List) return null;

  final items = Map<String, Map<String, dynamic>>.from(local.items);
  for (final key in removed) {
    if (key is String) items.remove(key);
  }
  for (final work in changed) {
    if (work is! Map) continue;
    final courseId = work['courseId'];
    final id = work['id'];
    if (courseId is! String || id is! String) continue;
    items['$courseId/$id'] = Map<String, dynamic>.from(work);
  }

  // Cursos en el orden de Google; si uno falló, conserva el nombre guardado.
  final previousNames = {for (final c in local.courses) c['id']: c['name']};
  final mergedCourses = <Map<String, dynamic>>[];
  for (final course in courses) {
    if (course is! Map || course['id'] is! String) continue;
    final id = course['id'] as String;
    final name = course['name'] is String && (course['name'] as String).isNotEmpty
        ? course['name'] as String
        : (previousNames[id] as String? ?? '');
    mergedCourses.add({'id': id, 'name': name});
  }

  return LocalClassroomData(courses: mergedCourses, items: items);
}

/// Pide los cambios al servidor, los mezcla y los guarda.
/// Devuelve null si no se pudo (sin red, sesión, token revocado, error):
/// en ese caso la copia local se queda como estaba.
Future<LocalClassroomData?> syncStudent(String studentId) async {
  final local = await loadLocal(studentId) ?? LocalClassroomData.empty();

  String? idToken;
  try {
    idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
  } catch (_) {
    return null;
  }
  if (idToken == null || idToken.isEmpty) return null;

  ApiCallResponse response;
  try {
    response = await ClassroomSyncCall.call(
      studentId: studentId,
      known: local.known,
      idToken: idToken,
    );
  } catch (_) {
    return null;
  }
  if (!response.succeeded) return null;

  final merged = mergeSyncResponse(local, response.jsonBody);
  if (merged == null) return null;
  await saveLocal(studentId, merged);
  return merged;
}

/// Arma la lista que muestra Student Work, igual que lo hacía `courses()`:
/// por curso, setCourseName (nombre y filtro de semanas) y joinAssigments;
/// por tarea, el id y el estado de la entrega y creatDateTime.
List<CourseWorkStruct> buildWorkList(LocalClassroomData data, int weeksFilter) {
  var result = <CourseWorkStruct>[];
  final submissions = <String, Map>{};

  for (final course in data.courses) {
    final courseId = course['id'] as String;
    final works = <CourseWorkStruct>[];
    data.items.forEach((key, item) {
      if (!key.startsWith('$courseId/')) return;
      final updateTime = item['updateTime'];
      if (updateTime is! String || DateTime.tryParse(updateTime) == null) return;
      final work = CourseWorkStruct.maybeFromMap(item);
      if (work == null) return;
      final submission = item['studentSubmission'];
      if (submission is Map) submissions[key] = submission;
      works.add(work);
    });

    result = functions
            .joinAssigments(
              result,
              functions.setCourseName(
                works,
                course['name'] as String?,
                getCurrentTimestamp,
                weeksFilter,
              ),
            )
            ?.toList() ??
        result;
  }

  for (final work in result) {
    final submission = submissions['${work.courseId}/${work.id}'];
    work
      ..studentSubmissionId = submission?['id'] as String?
      ..actualStatus = submission?['state'] as String?
      ..datetime = functions.creatDateTime(
        work.dueDate.year,
        work.dueDate.month,
        work.dueDate.day,
      );
  }
  return result;
}

/// Quita al estudiante de la cuenta del padre en el servidor y borra su copia
/// local. Devuelve false si no se pudo; en ese caso no se borra nada.
Future<bool> removeStudent(String studentId) async {
  String? idToken;
  try {
    idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
  } catch (_) {
    return false;
  }
  if (idToken == null || idToken.isEmpty) return false;

  try {
    final response = await RemoveStudentCall.call(
      studentId: studentId,
      idToken: idToken,
    );
    if (!response.succeeded) return false;
  } catch (_) {
    return false;
  }

  await deleteLocal(studentId);
  if (currentStudentId == studentId) openStudent(null);
  return true;
}

/// Marca el estudiante abierto. `syncedNow` indica que ya se sincronizó
/// al abrirlo, para no repetir la llamada en `courses()`.
void openStudent(String? studentId, {bool syncedNow = false}) {
  currentStudentId = studentId;
  _syncedOnOpen = syncedNow;
}

/// true una sola vez si el estudiante ya se sincronizó al abrirlo.
bool consumeSyncedOnOpen() {
  final value = _syncedOnOpen;
  _syncedOnOpen = false;
  return value;
}
