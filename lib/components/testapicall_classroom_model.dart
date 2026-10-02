import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'testapicall_classroom_widget.dart' show TestapicallClassroomWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestapicallClassroomModel
    extends FlutterFlowModel<TestapicallClassroomWidget> {
  ///  Local state fields for this component.

  String? response = '- - -';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Courses)] action in testapicallClassroom widget.
  ApiCallResponse? apiResultuzj;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
