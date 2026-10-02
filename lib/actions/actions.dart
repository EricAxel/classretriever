import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future accsestoken(
  BuildContext context, {
  required StudentsRecord? studentsRef,
  required String? refreshToken,
  required String? name,
}) async {
  ApiCallResponse? refreshTokenResponseActinBlock;
  ApiCallResponse? coursestokenBlock;

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
  refreshTokenResponseActinBlock =
      await GoogleOAuthTokenExchangeGroup.refreshTokenCall.call(
    clientId:
        const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_ID'),
    clientSecret: const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_SECRET'),
    refreshToken: refreshToken,
    grantType: 'refresh_token',
  );

  if ((refreshTokenResponseActinBlock?.succeeded ?? true)) {
    FFAppState().tknAt1 =
        GoogleOAuthTokenExchangeGroup.refreshTokenCall.accsestoken(
      (refreshTokenResponseActinBlock?.jsonBody ?? ''),
    )!;
    FFAppState().update(() {});
    coursestokenBlock = await GoogleClassroomGroup.coursesCall.call(
      token: FFAppState().tknAt1,
    );

    if ((coursestokenBlock?.succeeded ?? true)) {
      FFAppState().coursesSimplelist =
          CourseslistStruct.maybeFromMap((coursestokenBlock?.jsonBody ?? ''))!
              .courses
              .toList()
              .cast<CoursesStruct>();
      FFAppState().update(() {});
    } else {
      FFAppState().loadingAnimationAction = false;
      FFAppState().studenLoadingReference = null;
      FFAppState().update(() {});
      return;
    }

    FFAppState().studenLoadingReference = null;

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
}

Future courses(
  BuildContext context, {
  required String? name,
}) async {
  ApiCallResponse? coursesWorkListBlock;
  ApiCallResponse? subbmissionstatusBlock;
  ApiCallResponse? finalStatusBlock;

  while (FFAppState().coursesSimplelist.length >= 1) {
    coursesWorkListBlock = await GoogleClassroomGroup.courseWorkListCall.call(
      courseId: FFAppState().coursesSimplelist.firstOrNull?.id,
      token: FFAppState().tknAt1,
    );

    if ((coursesWorkListBlock?.succeeded ?? true)) {
      FFAppState().completeCoursesWorkList2 = functions
          .joinAssigments(
              FFAppState().completeCoursesWorkList2.toList(),
              functions
                  .setCourseName(
                      CourseWorklistStruct.maybeFromMap(
                              (coursesWorkListBlock?.jsonBody ?? ''))
                          ?.courseWork
                          ?.toList(),
                      FFAppState().coursesSimplelist.firstOrNull?.name,
                      getCurrentTimestamp,
                      FFAppState().weeksFilter)
                  ?.toList())!
          .toList()
          .cast<CourseWorkStruct>();
      FFAppState().removeAtIndexFromCoursesSimplelist(0);
      FFAppState().actionStudents = 90;
      FFAppState().update(() {});
    } else {
      FFAppState().loadingAnimationAction = false;
      FFAppState().studenLoadingReference = null;
      FFAppState().update(() {});
    }
  }
  while (FFAppState().completeCoursesWorkList2.length >= 1) {
    subbmissionstatusBlock =
        await GoogleClassroomGroup.submissionStatusCall.call(
      courseId: FFAppState().completeCoursesWorkList2.firstOrNull?.courseId,
      courseWorkId: FFAppState().completeCoursesWorkList2.firstOrNull?.id,
      token: FFAppState().tknAt1,
    );

    finalStatusBlock = await GoogleClassroomGroup.statusAssigmentCall.call(
      courseId: FFAppState().completeCoursesWorkList2.firstOrNull?.courseId,
      courseWorkId: FFAppState().completeCoursesWorkList2.firstOrNull?.id,
      id: GoogleClassroomGroup.submissionStatusCall.studentId(
        (subbmissionstatusBlock?.jsonBody ?? ''),
      ),
      token: FFAppState().tknAt1,
    );

    if ((finalStatusBlock?.succeeded ?? true)) {
      FFAppState().updateCompleteCoursesWorkList2AtIndex(
        0,
        (e) => e
          ..studentSubmissionId =
              GoogleClassroomGroup.submissionStatusCall.studentId(
            (subbmissionstatusBlock?.jsonBody ?? ''),
          )
          ..actualStatus = GoogleClassroomGroup.statusAssigmentCall.state(
            (finalStatusBlock?.jsonBody ?? ''),
          )
          ..datetime = functions.creatDateTime(
              FFAppState().completeCoursesWorkList2.firstOrNull?.dueDate?.year,
              FFAppState().completeCoursesWorkList2.firstOrNull?.dueDate?.month,
              FFAppState().completeCoursesWorkList2.firstOrNull?.dueDate?.day),
      );
      FFAppState().update(() {});
      FFAppState().addToCoursesWorkList3(
          FFAppState().completeCoursesWorkList2.firstOrNull!);
      FFAppState().update(() {});
      FFAppState().removeAtIndexFromCompleteCoursesWorkList2(0);
    }
  }
  FFAppState().loadingAnimationAction = false;
}

Future accsesTokenRefresh(
  BuildContext context, {
  DocumentReference? studentsRef,
  String? refreshToken,
  String? name,
}) async {
  ApiCallResponse? refreshTokenResponseActinBlockrefresh;
  ApiCallResponse? coursestokenBlockrefresh;

  FFAppState().loadingAnimationAction = true;
  FFAppState().studenLoadingReference = studentsRef;
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
  refreshTokenResponseActinBlockrefresh =
      await GoogleOAuthTokenExchangeGroup.refreshTokenCall.call(
    clientId:
        const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_ID'),
    clientSecret: const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_SECRET'),
    refreshToken: refreshToken,
    grantType: 'refresh_token',
  );

  if ((refreshTokenResponseActinBlockrefresh?.succeeded ?? true)) {
    FFAppState().tknAt1 =
        GoogleOAuthTokenExchangeGroup.refreshTokenCall.accsestoken(
      (refreshTokenResponseActinBlockrefresh?.jsonBody ?? ''),
    )!;
    FFAppState().update(() {});
    coursestokenBlockrefresh = await GoogleClassroomGroup.coursesCall.call(
      token: FFAppState().tknAt1,
    );

    if ((coursestokenBlockrefresh?.succeeded ?? true)) {
      FFAppState().coursesSimplelist = CourseslistStruct.maybeFromMap(
              (coursestokenBlockrefresh?.jsonBody ?? ''))!
          .courses
          .toList()
          .cast<CoursesStruct>();
      FFAppState().update(() {});
    } else {
      FFAppState().loadingAnimationAction = false;
      FFAppState().studenLoadingReference = null;
      FFAppState().update(() {});
      return;
    }

    FFAppState().studenLoadingReference = null;
  }
}
