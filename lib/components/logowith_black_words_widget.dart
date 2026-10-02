import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logowith_black_words_model.dart';
export 'logowith_black_words_model.dart';

class LogowithBlackWordsWidget extends StatefulWidget {
  const LogowithBlackWordsWidget({super.key});

  @override
  State<LogowithBlackWordsWidget> createState() =>
      _LogowithBlackWordsWidgetState();
}

class _LogowithBlackWordsWidgetState extends State<LogowithBlackWordsWidget> {
  late LogowithBlackWordsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogowithBlackWordsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.12,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? 'assets/images/class-retriever-logo-white-rgb-900px-w-72ppi.png'
                : 'assets/images/class-retriever-logo-full-color-rgb-900px-w-72ppi(1).png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
