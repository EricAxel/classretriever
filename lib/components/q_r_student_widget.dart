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
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_r_student_model.dart';
export 'q_r_student_model.dart';

class QRStudentWidget extends StatefulWidget {
  const QRStudentWidget({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  State<QRStudentWidget> createState() => _QRStudentWidgetState();
}

class _QRStudentWidgetState extends State<QRStudentWidget> {
  late QRStudentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRStudentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        // Replace background image here.
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/Yellow-Dark03.jpg'
                    : 'assets/images/Yellow-Waves.jpg',
              ).image,
            ),
          ),
          child:
              // Make sure you remove the background color (Surface Dim) for all the block containers:
              //
              // 1. Top navigation / Header
              // 2. Primary Navigation
              // 3. Body
              // 4. Bottom navigation / Footer
              Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: 24.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
              Flexible(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Responsive safe area,
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 111.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 111.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 64.0;
                          } else {
                            return 64.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: FutureBuilder<QrRecord>(
                              future: (_model.documentRequestCompleter ??=
                                      Completer<QrRecord>()
                                        ..complete(QrRecord.getDocumentOnce(
                                            FFAppState().qr!)))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final stackQrRecord = snapshot.data!;

                                return Stack(
                                  children: [
                                    if (!stackQrRecord.complete)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            curve: Curves.linear,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            constraints: BoxConstraints(
                                              maxWidth: kBreakpointSmall,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32.0),
                                                topRight: Radius.circular(32.0),
                                                bottomLeft:
                                                    Radius.circular(32.0),
                                                bottomRight:
                                                    Radius.circular(32.0),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 24.0, 20.0, 24.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'Your student should use this QR code to grant you permission to connect to their Google Classroom account.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'When Google asks your student what information Class Retriever can access, they should check the box next to \"Select All.\"',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Container(
                                                            width: 1.0,
                                                            height: 1.0,
                                                            child:
                                                                custom_widgets
                                                                    .Vizd(
                                                              width: 1.0,
                                                              height: 1.0,
                                                              index: 1,
                                                              onVisible:
                                                                  () async {
                                                                _model
                                                                    .timerXController
                                                                    .onStartTimer();
                                                                while (
                                                                    stackQrRecord
                                                                        .status) {
                                                                  safeSetState(() =>
                                                                      _model.documentRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForDocumentRequestCompleted();
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                      milliseconds:
                                                                          1000,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              onout:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'This code will expire in',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                              FlutterFlowTimer(
                                                                initialTime: _model
                                                                    .timerXInitialTimeMs,
                                                                getDisplayTime:
                                                                    (value) =>
                                                                        StopWatchTimer
                                                                            .getDisplayTime(
                                                                  value,
                                                                  hours: false,
                                                                  milliSecond:
                                                                      false,
                                                                ),
                                                                controller: _model
                                                                    .timerXController,
                                                                updateStateInterval:
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                onChanged: (value,
                                                                    displayTime,
                                                                    shouldUpdate) {
                                                                  _model.timerXMilliseconds =
                                                                      value;
                                                                  _model.timerXValue =
                                                                      displayTime;
                                                                  if (shouldUpdate)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                onEnded:
                                                                    () async {
                                                                  await stackQrRecord
                                                                      .reference
                                                                      .update(
                                                                          createQrRecordData(
                                                                    status:
                                                                        false,
                                                                  ));
                                                                  safeSetState(() =>
                                                                      _model.documentRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForDocumentRequestCompleted();
                                                                },
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .headlineSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  child:
                                                                      BarcodeWidget(
                                                                    data: valueOrDefault<
                                                                        String>(
                                                                      '${stackQrRecord.url}${stackQrRecord.reference.id}AX4',
                                                                      'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                                                                    ),
                                                                    barcode: Barcode
                                                                        .qrCode(),
                                                                    width:
                                                                        220.0,
                                                                    height:
                                                                        220.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    errorBuilder:
                                                                        (_context,
                                                                                _error) =>
                                                                            SizedBox(
                                                                      width:
                                                                          220.0,
                                                                      height:
                                                                          220.0,
                                                                    ),
                                                                    drawText:
                                                                        true,
                                                                  ),
                                                                ),
                                                                if (!stackQrRecord
                                                                    .status)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter
                                                                          .blur(
                                                                        sigmaX:
                                                                            6.0,
                                                                        sigmaY:
                                                                            6.0,
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            260.0,
                                                                        height:
                                                                            260.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x33FDBD29),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var qrRecordReference = QrRecord.collection.doc();
                                                                                await qrRecordReference.set(createQrRecordData(
                                                                                  url: stackQrRecord.url,
                                                                                  time: getCurrentTimestamp,
                                                                                  status: true,
                                                                                ));
                                                                                _model.qrgeneratedCopyyy = QrRecord.getDocumentFromData(
                                                                                    createQrRecordData(
                                                                                      url: stackQrRecord.url,
                                                                                      time: getCurrentTimestamp,
                                                                                      status: true,
                                                                                    ),
                                                                                    qrRecordReference);
                                                                                await FFAppState().qr!.delete();
                                                                                FFAppState().qr = _model.qrgeneratedCopyyy?.reference;
                                                                                FFAppState().update(() {});
                                                                                _model.timerXController.onResetTimer();

                                                                                _model.timerXController.onStartTimer();
                                                                                safeSetState(() => _model.documentRequestCompleter = null);
                                                                                await _model.waitForDocumentRequestCompleted();

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.replay,
                                                                                color: Colors.white,
                                                                                size: 80.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'If your student sees a blank screen when they scan this code, make sure their browser allows pop-ups and try again.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          18.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      var qrRecordReference = QrRecord
                                                                          .collection
                                                                          .doc();
                                                                      await qrRecordReference
                                                                          .set(
                                                                              createQrRecordData(
                                                                        url: stackQrRecord
                                                                            .url,
                                                                        time:
                                                                            getCurrentTimestamp,
                                                                        status:
                                                                            true,
                                                                      ));
                                                                      _model.qrgenerated = QrRecord.getDocumentFromData(
                                                                          createQrRecordData(
                                                                            url:
                                                                                stackQrRecord.url,
                                                                            time:
                                                                                getCurrentTimestamp,
                                                                            status:
                                                                                true,
                                                                          ),
                                                                          qrRecordReference);
                                                                      await FFAppState()
                                                                          .qr!
                                                                          .delete();
                                                                      FFAppState()
                                                                              .qr =
                                                                          _model
                                                                              .qrgenerated
                                                                              ?.reference;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      _model
                                                                          .timerXController
                                                                          .onResetTimer();

                                                                      _model
                                                                          .timerXController
                                                                          .onStartTimer();
                                                                      safeSetState(() =>
                                                                          _model.documentRequestCompleter =
                                                                              null);
                                                                      await _model
                                                                          .waitForDocumentRequestCompleted();

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      'Refresh QR Code',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          18.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          HomeHomeWidget
                                                                              .routeName);
                                                                    },
                                                                    child: Text(
                                                                      'Home',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (stackQrRecord.complete)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            curve: Curves.linear,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 300.0,
                                            constraints: BoxConstraints(
                                              maxWidth: kBreakpointSmall,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32.0),
                                                topRight: Radius.circular(32.0),
                                                bottomLeft:
                                                    Radius.circular(32.0),
                                                bottomRight:
                                                    Radius.circular(32.0),
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        25.0,
                                                                        0.0),
                                                            child: Text(
                                                              'The code has been scanned, please follow the steps requested by Google.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  18.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'Start over',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              HomeHomeWidget
                                                                  .routeName);
                                                        },
                                                        child: Text(
                                                          'Home',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 1.0,
                                                  height: 1.0,
                                                  child: custom_widgets.Vizd(
                                                    width: 1.0,
                                                    height: 1.0,
                                                    onVisible: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      while (_model.bool2) {
                                                        _model.studentsquery =
                                                            await queryStudentsRecordOnce(
                                                          queryBuilder:
                                                              (studentsRecord) =>
                                                                  studentsRecord
                                                                      .where(
                                                            'email',
                                                            isEqualTo:
                                                                widget!.email,
                                                          ),
                                                          limit: 2,
                                                        );
                                                        _shouldSetState = true;
                                                        if (_model
                                                                .studentsquery!
                                                                .length >=
                                                            1) {
                                                          if (_model
                                                              .studentsquery!
                                                              .firstOrNull!
                                                              .usersUids
                                                              .contains(
                                                                  currentUserUid)) {
                                                            context.pushNamed(
                                                                ConnectionInfo2Widget
                                                                    .routeName);

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            if (_model
                                                                    .counterIntents! >=
                                                                5) {
                                                              context.pushNamed(
                                                                  HomeHomeWidget
                                                                      .routeName);
                                                            }
                                                          }
                                                        } else {
                                                          if (_model
                                                                  .counterIntents! >=
                                                              5) {
                                                            context.pushNamed(
                                                                HomeHomeWidget
                                                                    .routeName);
                                                          }
                                                        }

                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 10000,
                                                          ),
                                                        );
                                                      }
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    onout: () async {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: 24.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: Color(0x00FDBD29),
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
