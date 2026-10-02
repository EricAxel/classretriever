import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'q_r_student_widget.dart' show QRStudentWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QRStudentModel extends FlutterFlowModel<QRStudentWidget> {
  ///  Local state fields for this component.

  bool loop = true;

  bool bool2 = true;

  int? counterIntents = 1;

  ///  State fields for stateful widgets in this component.

  Completer<QrRecord>? documentRequestCompleter;
  // State field(s) for Timer_x widget.
  final timerXInitialTimeMs = 180000;
  int timerXMilliseconds = 180000;
  String timerXValue = StopWatchTimer.getDisplayTime(
    180000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerXController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  QrRecord? qrgeneratedCopyyy;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  QrRecord? qrgenerated;
  // Stores action output result for [Firestore Query - Query a collection] action in Vizd widget.
  List<StudentsRecord>? studentsquery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerXController.dispose();
  }

  /// Additional helper methods.
  Future waitForDocumentRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
