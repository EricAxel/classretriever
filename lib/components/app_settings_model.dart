import '/components/dark_light_mode_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'app_settings_widget.dart' show AppSettingsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppSettingsModel extends FlutterFlowModel<AppSettingsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for dark_light_mode component.
  late DarkLightModeModel darkLightModeModel;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {
    darkLightModeModel = createModel(context, () => DarkLightModeModel());
  }

  @override
  void dispose() {
    darkLightModeModel.dispose();
  }
}
