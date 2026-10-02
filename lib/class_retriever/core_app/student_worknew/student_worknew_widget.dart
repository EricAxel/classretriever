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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'student_worknew_model.dart';
export 'student_worknew_model.dart';

class StudentWorknewWidget extends StatefulWidget {
  const StudentWorknewWidget({
    super.key,
    required this.name,
    required this.studentDoc,
  });

  final String? name;
  final StudentsRecord? studentDoc;

  static String routeName = 'StudentWorknew';
  static String routePath = '/StudentWorknew';

  @override
  State<StudentWorknewWidget> createState() => _StudentWorknewWidgetState();
}

class _StudentWorknewWidgetState extends State<StudentWorknewWidget> {
  late StudentWorknewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentWorknewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          await action_blocks.courses(
            context,
            name: widget!.name,
          );
          if (!FFAppState().studenWalkTrough) {
            safeSetState(() {});
            safeSetState(() => _model.studentWorkNewController =
                createPageWalkthrough(context));
            _model.studentWorkNewController?.show(context: context);
            FFAppState().studenWalkTrough = true;
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (!FFAppState().initialAlertDialog1) {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: LoadingDataWidget(),
                  ),
                );
              },
            );

            FFAppState().initialAlertDialog1 = true;
            safeSetState(() {});
          }
        }),
      ]);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
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
                            : 'assets/images/Yellow-Light01.jpg',
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
                                  return 50.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 50.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 50.0;
                                } else {
                                  return 50.0;
                                }
                              }(),
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Visibility(
                                visible: FFAppState().loadingAnimationAction,
                                child: Lottie.asset(
                                  'assets/jsons/OXt0QYUbKN.json',
                                  width: 70.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 325.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget!.name,
                                                  'Your Student',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.submited = 'TURNED_IN';
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 140.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.submited ==
                                                              'TURNED_IN'
                                                          ? Color(0x46FDBD29)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.submited ==
                                                                'TURNED_IN'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Submitted ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.submited = 'NONE';
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 140.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.submited == 'NONE'
                                                          ? Color(0x46FDBD29)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.submited ==
                                                                'NONE'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Unsubmitted ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.refresh_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  await action_blocks
                                                      .accsesTokenRefresh(
                                                    context,
                                                    studentsRef: widget!
                                                        .studentDoc?.reference,
                                                    refreshToken: widget!
                                                        .studentDoc
                                                        ?.googleRefreshToken,
                                                    name: widget!.name,
                                                  );
                                                  await action_blocks.courses(
                                                    context,
                                                    name: widget!.name,
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final rowslisted2 = (_model.submited == 'TURNED_IN'
                                                      ? (_model.sortbydateOrCourseName
                                                          ? (_model.sortascending
                                                              ? FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'TURNED_IN') || (e.actualStatus == 'RETURNED') || (e.actualStatus == 'STUDENT_EDITED_AFTER_TURN_IN')).toList().sortedList(
                                                                  keyOf: (e) => e
                                                                      .datetime!,
                                                                  desc: false)
                                                              : FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'TURNED_IN') || (e.actualStatus == 'RETURNED') || (e.actualStatus == 'STUDENT_EDITED_AFTER_TURN_IN')).toList().sortedList(
                                                                  keyOf: (e) => e
                                                                      .datetime!,
                                                                  desc: true))
                                                          : (_model.sortascending
                                                              ? FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'TURNED_IN') || (e.actualStatus == 'RETURNED') || (e.actualStatus == 'STUDENT_EDITED_AFTER_TURN_IN')).toList().sortedList(
                                                                  keyOf: (e) => e
                                                                      .coursename,
                                                                  desc: false)
                                                              : FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'TURNED_IN') || (e.actualStatus == 'RETURNED') || (e.actualStatus == 'STUDENT_EDITED_AFTER_TURN_IN')).toList().sortedList(
                                                                  keyOf: (e) => e
                                                                      .coursename,
                                                                  desc: true)))
                                                      : (_model.sortbydateOrCourseName
                                                          ? (_model.sortascending
                                                              ? FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'NEW') || (e.actualStatus == 'CREATED') || (e.actualStatus == 'SUBMISSION_STATE_UNSPECIFIED')).toList().sortedList(keyOf: (e) => e.datetime!, desc: false)
                                                              : FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'NEW') || (e.actualStatus == 'CREATED') || (e.actualStatus == 'SUBMISSION_STATE_UNSPECIFIED')).toList().sortedList(keyOf: (e) => e.datetime!, desc: true))
                                                          : (_model.sortascending ? FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'NEW') || (e.actualStatus == 'CREATED') || (e.actualStatus == 'SUBMISSION_STATE_UNSPECIFIED')).toList().sortedList(keyOf: (e) => e.coursename, desc: false) : FFAppState().coursesWorkList3.where((e) => (e.actualStatus == 'NEW') || (e.actualStatus == 'CREATED') || (e.actualStatus == 'SUBMISSION_STATE_UNSPECIFIED')).toList().sortedList(keyOf: (e) => e.coursename, desc: true))))
                                                  .toList();

                                              return SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      rowslisted2.length,
                                                      (rowslisted2Index) {
                                                    final rowslisted2Item =
                                                        rowslisted2[
                                                            rowslisted2Index];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (rowslisted2Index ==
                                                            0)
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xB1FF6F00),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Flexible(
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
                                                                      _model.sortascending =
                                                                          !_model
                                                                              .sortascending;
                                                                      _model.sortbydateOrCourseName =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.33,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Transform
                                                                              .rotate(
                                                                            angle:
                                                                                (_model.sortascending ? 0.0 : 180.0) * (math.pi / 180),
                                                                            child:
                                                                                Visibility(
                                                                              visible: !_model.sortbydateOrCourseName,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.arrow_downward,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  valueOrDefault<double>(
                                                                                    _model.sortbydateOrCourseName ? 10.0 : 2.0,
                                                                                    4.0,
                                                                                  ),
                                                                                  0.0,
                                                                                  5.0,
                                                                                  0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.sortascending = !_model.sortascending;
                                                                                  _model.sortbydateOrCourseName = false;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Text(
                                                                                  'Course',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        row3t82ar9u,
                                                                        _model
                                                                            .studentWorkNewController,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.33,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Assignment',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ).addWalkthrough(
                                                                          text36et3j2b,
                                                                          _model
                                                                              .studentWorkNewController,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
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
                                                                      _model.sortascending =
                                                                          !_model
                                                                              .sortascending;
                                                                      _model.sortbydateOrCourseName =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.33,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00FFFFFF),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Transform
                                                                              .rotate(
                                                                            angle:
                                                                                (_model.sortascending ? 0.0 : 180.0) * (math.pi / 180),
                                                                            child:
                                                                                Visibility(
                                                                              visible: _model.sortbydateOrCourseName,
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.arrow_downward,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  valueOrDefault<double>(
                                                                                    _model.sortbydateOrCourseName ? 2.0 : 15.0,
                                                                                    2.0,
                                                                                  ),
                                                                                  0.0,
                                                                                  5.0,
                                                                                  0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.sortascending = !_model.sortascending;
                                                                                  _model.sortbydateOrCourseName = true;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Text(
                                                                                  'Due',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ).addWalkthrough(
                                                                        rowNoaols3s,
                                                                        _model
                                                                            .studentWorkNewController,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 80.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    functions.nonePar(
                                                                            rowslisted2Index)!
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primaryBackground
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.33,
                                                                          height:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  rowslisted2Item.coursename,
                                                                                  'Course name',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: valueOrDefault<Color>(
                                                                                        () {
                                                                                          if (rowslisted2Item.dueDate.year == 0) {
                                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                                          } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(rowslisted2Item.dueDate.year.toString(), rowslisted2Item.dueDate.month.toString(), rowslisted2Item.dueDate.day.toString())!) && (_model.submited != 'TURNED_IN')) {
                                                                                            return FlutterFlowTheme.of(context).worksItems;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                                          }
                                                                                        }(),
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.33,
                                                                          height:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                              child: AutoSizeText(
                                                                                valueOrDefault<String>(
                                                                                  rowslisted2Item.title,
                                                                                  'Title',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: valueOrDefault<Color>(
                                                                                        () {
                                                                                          if (rowslisted2Item.dueDate.year == 0) {
                                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                                          } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(rowslisted2Item.dueDate.year.toString(), rowslisted2Item.dueDate.month.toString(), rowslisted2Item.dueDate.day.toString())!) && (_model.submited != 'TURNED_IN')) {
                                                                                            return FlutterFlowTheme.of(context).worksItems;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).primaryText;
                                                                                          }
                                                                                        }(),
                                                                                        FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.33,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                5.0,
                                                                                5.0,
                                                                                5.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.dueDateTransform(rowslisted2Item.dueDate.year.toString(), rowslisted2Item.dueDate.month.toString(), rowslisted2Item.dueDate.day.toString(), rowslisted2Item.dueTime.hours.toString(), rowslisted2Item.dueTime.minutes.toString()),
                                                                                '- - / - - / - -',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: valueOrDefault<Color>(
                                                                                      () {
                                                                                        if (rowslisted2Item.dueDate.year == 0) {
                                                                                          return FlutterFlowTheme.of(context).primaryText;
                                                                                        } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(rowslisted2Item.dueDate.year.toString(), rowslisted2Item.dueDate.month.toString(), rowslisted2Item.dueDate.day.toString())!) && (_model.submited != 'TURNED_IN')) {
                                                                                          return FlutterFlowTheme.of(context).worksItems;
                                                                                        } else {
                                                                                          return FlutterFlowTheme.of(context).primaryText;
                                                                                        }
                                                                                      }(),
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }).addToEnd(
                                                      SizedBox(height: 80.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
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
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      FFAppState().loadingAnimationAction = false;
                      safeSetState(() {});

                      context.pushNamed(HomeHomeWidget.routeName);
                    },
                  ),
                ),
                if (FFAppState().loadingAnimationAction)
                  Align(
                    alignment: AlignmentDirectional(2.92, -0.33),
                    child: Lottie.asset(
                      'assets/jsons/OXt0QYUbKN.json',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.studentWorkNewController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
