import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/student_work_new.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'student_worknew_widget.dart' show StudentWorknewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StudentWorknewModel extends FlutterFlowModel<StudentWorknewWidget> {
  ///  Local state fields for this page.

  bool selectCourses = true;

  String submited = 'TURNED_IN';

  bool sortascending = false;

  bool sortbydateOrCourseName = true;

  bool tabel = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? studentWorkNewController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    studentWorkNewController?.finish();
  }
}
