import '/auth/firebase_auth/auth_util.dart';
import '/components/email_verified_widget.dart';
import '/components/logo_badge_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'welcome1_widget.dart' show Welcome1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Welcome1Model extends FlutterFlowModel<Welcome1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for LogoBadge component.
  late LogoBadgeModel logoBadgeModel;

  @override
  void initState(BuildContext context) {
    logoBadgeModel = createModel(context, () => LogoBadgeModel());
  }

  @override
  void dispose() {
    logoBadgeModel.dispose();
  }
}
