import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'student_work_model.dart';
export 'student_work_model.dart';

class StudentWorkWidget extends StatefulWidget {
  const StudentWorkWidget({
    super.key,
    required this.name,
  });

  final String? name;

  static String routeName = 'StudentWork';
  static String routePath = '/StudentWork';

  @override
  State<StudentWorkWidget> createState() => _StudentWorkWidgetState();
}

class _StudentWorkWidgetState extends State<StudentWorkWidget> {
  late StudentWorkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentWorkModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.submited = 'TURNED_IN';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 140.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.submited == 'TURNED_IN'
                                                      ? Color(0x46FDBD29)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.submited ==
                                                            'TURNED_IN'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Submitted',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.submited = 'NONE';
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 140.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.submited == 'NONE'
                                                      ? Color(0x46FDBD29)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.submited == 'NONE'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Unsubmitted',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final unsimitedWorkList = (_model.submited ==
                                                            'TURNED_IN'
                                                        ? (_model.sortbydateOrCourseName
                                                            ? (_model.sortascending
                                                                ? FFAppState().coursesWorkList3.where((e) => e.actualStatus == 'TURNED_IN').toList().sortedList(
                                                                    keyOf: (e) => e
                                                                        .datetime!,
                                                                    desc: false)
                                                                : FFAppState()
                                                                    .coursesWorkList3
                                                                    .where((e) =>
                                                                        e.actualStatus ==
                                                                        'TURNED_IN')
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .datetime!,
                                                                        desc:
                                                                            true))
                                                            : (_model.sortascending
                                                                ? FFAppState()
                                                                    .coursesWorkList3
                                                                    .where((e) => e.actualStatus == 'TURNED_IN')
                                                                    .toList()
                                                                    .sortedList(keyOf: (e) => e.coursename, desc: false)
                                                                : FFAppState().coursesWorkList3.where((e) => e.actualStatus == 'TURNED_IN').toList().sortedList(keyOf: (e) => e.coursename, desc: true)))
                                                        : (_model.sortbydateOrCourseName ? (_model.sortascending ? FFAppState().coursesWorkList3.where((e) => e.actualStatus != 'TURNED_IN').toList().sortedList(keyOf: (e) => e.datetime!, desc: false) : FFAppState().coursesWorkList3.where((e) => e.actualStatus != 'TURNED_IN').toList().sortedList(keyOf: (e) => e.datetime!, desc: true)) : (_model.sortascending ? FFAppState().coursesWorkList3.where((e) => e.actualStatus != 'TURNED_IN').toList().sortedList(keyOf: (e) => e.coursename, desc: false) : FFAppState().coursesWorkList3.where((e) => e.actualStatus != 'TURNED_IN').toList().sortedList(keyOf: (e) => e.coursename, desc: true))))
                                                    .toList();

                                                return FlutterFlowDataTable<
                                                    CourseWorkStruct>(
                                                  controller: _model
                                                      .paginatedDataTableController,
                                                  data: unsimitedWorkList,
                                                  columnsBuilder:
                                                      (onSortChanged) => [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.sortascending =
                                                                !_model
                                                                    .sortascending;
                                                            _model.sortbydateOrCourseName =
                                                                false;
                                                            safeSetState(() {});
                                                          },
                                                          child: Text(
                                                            'Course',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.3,
                                                      onSort: !_model
                                                              .paginatedDataTableController
                                                              .sortAscending
                                                          ? onSortChanged
                                                          : null,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          'Assignment',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLargeIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.35,
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.sortascending =
                                                                !_model
                                                                    .sortascending;
                                                            _model.sortbydateOrCourseName =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          child: Text(
                                                            'Due',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLargeIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      fixedWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.18,
                                                      onSort: onSortChanged,
                                                    ),
                                                  ],
                                                  dataRowBuilder:
                                                      (unsimitedWorkListItem,
                                                              unsimitedWorkListIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                    color: MaterialStateProperty
                                                        .all(
                                                      unsimitedWorkListIndex %
                                                                  2 ==
                                                              0
                                                          ? Color(0xFFFBE6BF)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    cells: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          unsimitedWorkListItem
                                                              .coursename,
                                                          'Course name',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    () {
                                                                      if (unsimitedWorkListItem
                                                                              .dueDate
                                                                              .year ==
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(unsimitedWorkListItem.dueDate.year.toString(), unsimitedWorkListItem.dueDate.month.toString(), unsimitedWorkListItem.dueDate.day.toString())!) &&
                                                                          (_model.submited !=
                                                                              'TURNED_IN')) {
                                                                        return Color(
                                                                            0xFF8F0000);
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          unsimitedWorkListItem
                                                              .title,
                                                          'Title',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    () {
                                                                      if (unsimitedWorkListItem
                                                                              .dueDate
                                                                              .year ==
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(unsimitedWorkListItem.dueDate.year.toString(), unsimitedWorkListItem.dueDate.month.toString(), unsimitedWorkListItem.dueDate.day.toString())!) &&
                                                                          (_model.submited !=
                                                                              'TURNED_IN')) {
                                                                        return Color(
                                                                            0xFF8F0000);
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          '${unsimitedWorkListItem.dueDate.month.toString()}/${unsimitedWorkListItem.dueDate.day.toString()}/${unsimitedWorkListItem.dueDate.year.toString()}',
                                                          'No date assigned',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    () {
                                                                      if (unsimitedWorkListItem
                                                                              .dueDate
                                                                              .year ==
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      } else if ((functions.convertCurrentTimeintoStartDate(getCurrentTimestamp)! > functions.combinetoDateTime(unsimitedWorkListItem.dueDate.year.toString(), unsimitedWorkListItem.dueDate.month.toString(), unsimitedWorkListItem.dueDate.day.toString())!) &&
                                                                          (_model.submited !=
                                                                              'TURNED_IN')) {
                                                                        return Color(
                                                                            0xFF8F0000);
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      }
                                                                    }(),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList(),
                                                  ),
                                                  onSortChanged: (columnIndex,
                                                      ascending) async {
                                                    FFAppState()
                                                            .coursesWorkList3 =
                                                        functions
                                                            .sortMyData(
                                                                FFAppState()
                                                                    .coursesWorkList3
                                                                    .toList(),
                                                                columnIndex,
                                                                ascending)
                                                            .toList()
                                                            .cast<
                                                                CourseWorkStruct>();
                                                    safeSetState(() {});
                                                  },
                                                  paginated: true,
                                                  selectable: false,
                                                  hidePaginator: false,
                                                  showFirstLastButtons: true,
                                                  headingRowHeight: 35.0,
                                                  dataRowHeight: 40.0,
                                                  columnSpacing: 15.0,
                                                  headingRowColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  sortIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  addHorizontalDivider: false,
                                                  addTopAndBottomDivider: false,
                                                  hideDefaultHorizontalDivider:
                                                      false,
                                                  addVerticalDivider: false,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
