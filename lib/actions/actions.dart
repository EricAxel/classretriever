import '/backend/backend.dart';
import '/backend/classroom_sync.dart' as classroom_sync;
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Las tareas de Classroom se guardan en el teléfono y se sincronizan con la
// función `sync` de Firebase (ver lib/backend/classroom_sync.dart). El
// teléfono ya no recibe tokens de Google ni llama a Google directamente.

Future accsestoken(
  BuildContext context, {
  required StudentsRecord? studentsRef,
  required String? refreshToken,
  required String? name,
}) async {
  FFAppState().loadingAnimationAction = true;
  FFAppState().studenLoadingReference = studentsRef?.reference;
  FFAppState().action2 = true;
  FFAppState().actionStudents = 0;
  FFAppState().coursesWorkList3 = [];
  FFAppState().completeCoursesWorkList2 = [];
  FFAppState().coursesPreviewList = [];
  FFAppState().coursesSimplelist = [];
  FFAppState().completeCoursesWorkList = [];
  FFAppState().courseWork = CourseWorkStruct();
  FFAppState().coursesOnePage = CoursesStruct();
  FFAppState().update(() {});

  final studentId = studentsRef?.reference.id;
  if (studentId == null) {
    FFAppState().loadingAnimationAction = false;
    FFAppState().studenLoadingReference = null;
    FFAppState().update(() {});
    return;
  }

  // Con copia local, Student Work abre al instante y `courses()` revisa
  // cambios. Sin copia, se descarga aquí con la misma animación de carga.
  var data = await classroom_sync.loadLocal(studentId);
  var syncedNow = false;
  if (data == null) {
    data = await classroom_sync.syncStudent(studentId);
    if (data == null) {
      FFAppState().loadingAnimationAction = false;
      FFAppState().studenLoadingReference = null;
      FFAppState().update(() {});
      return;
    }
    syncedNow = true;
  }

  classroom_sync.openStudent(studentId, syncedNow: syncedNow);
  FFAppState().coursesWorkList3 =
      classroom_sync.buildWorkList(data, FFAppState().weeksFilter);
  FFAppState().studenLoadingReference = null;
  FFAppState().update(() {});

  context.pushNamed(
    StudentWorknewWidget.routeName,
    queryParameters: {
      'name': serializeParam(
        name,
        ParamType.String,
      ),
      'studentDoc': serializeParam(
        studentsRef,
        ParamType.Document,
      ),
    }.withoutNulls,
    extra: <String, dynamic>{
      'studentDoc': studentsRef,
    },
  );
}

Future courses(
  BuildContext context, {
  required String? name,
}) async {
  final studentId = classroom_sync.currentStudentId;
  if (studentId == null || classroom_sync.consumeSyncedOnOpen()) {
    FFAppState().loadingAnimationAction = false;
    FFAppState().update(() {});
    return;
  }

  FFAppState().loadingAnimationAction = true;
  FFAppState().update(() {});

  // Si falla (sin red, token revocado, Classroom caído), la lista guardada
  // se queda en pantalla y la carga se apaga.
  final data = await classroom_sync.syncStudent(studentId);
  if (data != null && classroom_sync.currentStudentId == studentId) {
    FFAppState().coursesWorkList3 =
        classroom_sync.buildWorkList(data, FFAppState().weeksFilter);
  }
  FFAppState().loadingAnimationAction = false;
  FFAppState().update(() {});
}

Future accsesTokenRefresh(
  BuildContext context, {
  DocumentReference? studentsRef,
  String? refreshToken,
  String? name,
}) async {
  // La lista se queda visible; `courses()` revisa los cambios.
  classroom_sync.openStudent(studentsRef?.id ?? classroom_sync.currentStudentId);
  FFAppState().loadingAnimationAction = true;
  FFAppState().update(() {});
}
