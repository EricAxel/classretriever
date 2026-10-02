import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/q_r_student_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'your_student_widget.dart' show YourStudentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YourStudentModel extends FlutterFlowModel<YourStudentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Students_name widget.
  FocusNode? studentsNameFocusNode;
  TextEditingController? studentsNameTextController;
  String? Function(BuildContext, String?)? studentsNameTextControllerValidator;
  String? _studentsNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Student\'s name is required';
    }

    return null;
  }

  // State field(s) for Students_email widget.
  FocusNode? studentsEmailFocusNode;
  TextEditingController? studentsEmailTextController;
  String? Function(BuildContext, String?)? studentsEmailTextControllerValidator;
  String? _studentsEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Student\'s email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QrRecord? qrGenerated1;

  @override
  void initState(BuildContext context) {
    studentsNameTextControllerValidator = _studentsNameTextControllerValidator;
    studentsEmailTextControllerValidator =
        _studentsEmailTextControllerValidator;
  }

  @override
  void dispose() {
    studentsNameFocusNode?.dispose();
    studentsNameTextController?.dispose();

    studentsEmailFocusNode?.dispose();
    studentsEmailTextController?.dispose();
  }
}
