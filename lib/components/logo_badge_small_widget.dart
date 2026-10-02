import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logo_badge_small_model.dart';
export 'logo_badge_small_model.dart';

class LogoBadgeSmallWidget extends StatefulWidget {
  const LogoBadgeSmallWidget({super.key});

  @override
  State<LogoBadgeSmallWidget> createState() => _LogoBadgeSmallWidgetState();
}

class _LogoBadgeSmallWidgetState extends State<LogoBadgeSmallWidget> {
  late LogoBadgeSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoBadgeSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: const CircleBorder(),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xBDFFFFFF),
                offset: Offset(
                  0.0,
                  0.0,
                ),
                spreadRadius: 8.0,
              )
            ],
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              width: 172.0,
              height: 346.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  image: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/Puppy_Only.png'
                        : 'assets/images/Puppy_Only.png',
                  ).image,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
