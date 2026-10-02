import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'confirm_delete_user_widget.dart' show ConfirmDeleteUserWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmDeleteUserModel extends FlutterFlowModel<ConfirmDeleteUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PasswordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
