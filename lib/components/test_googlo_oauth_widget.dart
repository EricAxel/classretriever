import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_googlo_oauth_model.dart';
export 'test_googlo_oauth_model.dart';

class TestGoogloOauthWidget extends StatefulWidget {
  const TestGoogloOauthWidget({
    super.key,
    required this.name,
    required this.uid,
    required this.action,
  });

  final String? name;
  final String? uid;

  /// validateform
  final Future Function()? action;

  @override
  State<TestGoogloOauthWidget> createState() => _TestGoogloOauthWidgetState();
}

class _TestGoogloOauthWidgetState extends State<TestGoogloOauthWidget> {
  late TestGoogloOauthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestGoogloOauthModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.action?.call();
        await launchURL(
            'https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/classroom.courses.readonly%20https://www.googleapis.com/auth/classroom.course-work.readonly%20https://www.googleapis.com/auth/classroom.student-submissions.me.readonly%20&response_type=code&client_id=633677209986-ts4b909gjsck167qvvhcfvd94kockufa.apps.googleusercontent.com&redirect_uri=https://classretrivertoken.flutterflow.app&state=A01X${widget!.uid}A02X${widget!.name}A03X');
      },
      text: 'Submit',
      options: FFButtonOptions(
        width: 180.0,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: Colors.black,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
