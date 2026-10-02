import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _eventList = prefs
              .getStringList('ff_eventList')
              ?.map((x) {
                try {
                  return EventStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _eventList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_coursesOnePage')) {
        try {
          final serializedData = prefs.getString('ff_coursesOnePage') ?? '{}';
          _coursesOnePage =
              CoursesStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _weeksFilter = prefs.getInt('ff_weeksFilter') ?? _weeksFilter;
    });
    _safeInit(() {
      _initialAlertDialog1 =
          prefs.getBool('ff_initialAlertDialog1') ?? _initialAlertDialog1;
    });
    _safeInit(() {
      _studenWalkTrough =
          prefs.getBool('ff_studenWalkTrough') ?? _studenWalkTrough;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<MessagesStruct> _meassegeslist = [];
  List<MessagesStruct> get meassegeslist => _meassegeslist;
  set meassegeslist(List<MessagesStruct> value) {
    _meassegeslist = value;
  }

  void addToMeassegeslist(MessagesStruct value) {
    meassegeslist.add(value);
  }

  void removeFromMeassegeslist(MessagesStruct value) {
    meassegeslist.remove(value);
  }

  void removeAtIndexFromMeassegeslist(int index) {
    meassegeslist.removeAt(index);
  }

  void updateMeassegeslistAtIndex(
    int index,
    MessagesStruct Function(MessagesStruct) updateFn,
  ) {
    meassegeslist[index] = updateFn(_meassegeslist[index]);
  }

  void insertAtIndexInMeassegeslist(int index, MessagesStruct value) {
    meassegeslist.insert(index, value);
  }

  List<EventStruct> _eventList = [
    EventStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Blood Letting\",\"description\":\"\",\"usersPhoto\":\"[\\\"https://picsum.photos/seed/347/600\\\",\\\"https://picsum.photos/seed/420/600\\\"]\",\"time\":\"8\"}')),
    EventStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Concert\",\"description\":\"All Pop hits\",\"usersPhoto\":\"[]\",\"time\":\"16\"}'))
  ];
  List<EventStruct> get eventList => _eventList;
  set eventList(List<EventStruct> value) {
    _eventList = value;
    prefs.setStringList(
        'ff_eventList', value.map((x) => x.serialize()).toList());
  }

  void addToEventList(EventStruct value) {
    eventList.add(value);
    prefs.setStringList(
        'ff_eventList', _eventList.map((x) => x.serialize()).toList());
  }

  void removeFromEventList(EventStruct value) {
    eventList.remove(value);
    prefs.setStringList(
        'ff_eventList', _eventList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromEventList(int index) {
    eventList.removeAt(index);
    prefs.setStringList(
        'ff_eventList', _eventList.map((x) => x.serialize()).toList());
  }

  void updateEventListAtIndex(
    int index,
    EventStruct Function(EventStruct) updateFn,
  ) {
    eventList[index] = updateFn(_eventList[index]);
    prefs.setStringList(
        'ff_eventList', _eventList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInEventList(int index, EventStruct value) {
    eventList.insert(index, value);
    prefs.setStringList(
        'ff_eventList', _eventList.map((x) => x.serialize()).toList());
  }

  DateTime? _selectedDay = DateTime.fromMillisecondsSinceEpoch(1728637200000);
  DateTime? get selectedDay => _selectedDay;
  set selectedDay(DateTime? value) {
    _selectedDay = value;
  }

  String _GoogleOauthClientID = '';
  String get GoogleOauthClientID => _GoogleOauthClientID;
  set GoogleOauthClientID(String value) {
    _GoogleOauthClientID = value;
  }

  List<TokensStruct> _tokens = [];
  List<TokensStruct> get tokens => _tokens;
  set tokens(List<TokensStruct> value) {
    _tokens = value;
  }

  void addToTokens(TokensStruct value) {
    tokens.add(value);
  }

  void removeFromTokens(TokensStruct value) {
    tokens.remove(value);
  }

  void removeAtIndexFromTokens(int index) {
    tokens.removeAt(index);
  }

  void updateTokensAtIndex(
    int index,
    TokensStruct Function(TokensStruct) updateFn,
  ) {
    tokens[index] = updateFn(_tokens[index]);
  }

  void insertAtIndexInTokens(int index, TokensStruct value) {
    tokens.insert(index, value);
  }

  List<dynamic> _jsontestresponse = [];
  List<dynamic> get jsontestresponse => _jsontestresponse;
  set jsontestresponse(List<dynamic> value) {
    _jsontestresponse = value;
  }

  void addToJsontestresponse(dynamic value) {
    jsontestresponse.add(value);
  }

  void removeFromJsontestresponse(dynamic value) {
    jsontestresponse.remove(value);
  }

  void removeAtIndexFromJsontestresponse(int index) {
    jsontestresponse.removeAt(index);
  }

  void updateJsontestresponseAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    jsontestresponse[index] = updateFn(_jsontestresponse[index]);
  }

  void insertAtIndexInJsontestresponse(int index, dynamic value) {
    jsontestresponse.insert(index, value);
  }

  dynamic _jsontest2;
  dynamic get jsontest2 => _jsontest2;
  set jsontest2(dynamic value) {
    _jsontest2 = value;
  }

  CourseslistStruct _coursesList = CourseslistStruct();
  CourseslistStruct get coursesList => _coursesList;
  set coursesList(CourseslistStruct value) {
    _coursesList = value;
  }

  void updateCoursesListStruct(Function(CourseslistStruct) updateFn) {
    updateFn(_coursesList);
  }

  CourseWorklistStruct _CourseWorklist = CourseWorklistStruct();
  CourseWorklistStruct get CourseWorklist => _CourseWorklist;
  set CourseWorklist(CourseWorklistStruct value) {
    _CourseWorklist = value;
  }

  void updateCourseWorklistStruct(Function(CourseWorklistStruct) updateFn) {
    updateFn(_CourseWorklist);
  }

  StudentSubmissionslistStruct _StudentSubmissionslist =
      StudentSubmissionslistStruct();
  StudentSubmissionslistStruct get StudentSubmissionslist =>
      _StudentSubmissionslist;
  set StudentSubmissionslist(StudentSubmissionslistStruct value) {
    _StudentSubmissionslist = value;
  }

  void updateStudentSubmissionslistStruct(
      Function(StudentSubmissionslistStruct) updateFn) {
    updateFn(_StudentSubmissionslist);
  }

  CourseWorkStruct _courseWork = CourseWorkStruct();
  CourseWorkStruct get courseWork => _courseWork;
  set courseWork(CourseWorkStruct value) {
    _courseWork = value;
  }

  void updateCourseWorkStruct(Function(CourseWorkStruct) updateFn) {
    updateFn(_courseWork);
  }

  CoursesStruct _coursesOnePage = CoursesStruct();
  CoursesStruct get coursesOnePage => _coursesOnePage;
  set coursesOnePage(CoursesStruct value) {
    _coursesOnePage = value;
    prefs.setString('ff_coursesOnePage', value.serialize());
  }

  void updateCoursesOnePageStruct(Function(CoursesStruct) updateFn) {
    updateFn(_coursesOnePage);
    prefs.setString('ff_coursesOnePage', _coursesOnePage.serialize());
  }

  String _tooken = '';
  String get tooken => _tooken;
  set tooken(String value) {
    _tooken = value;
  }

  List<CourseWorkStruct> _completeCoursesWorkList = [];
  List<CourseWorkStruct> get completeCoursesWorkList =>
      _completeCoursesWorkList;
  set completeCoursesWorkList(List<CourseWorkStruct> value) {
    _completeCoursesWorkList = value;
  }

  void addToCompleteCoursesWorkList(CourseWorkStruct value) {
    completeCoursesWorkList.add(value);
  }

  void removeFromCompleteCoursesWorkList(CourseWorkStruct value) {
    completeCoursesWorkList.remove(value);
  }

  void removeAtIndexFromCompleteCoursesWorkList(int index) {
    completeCoursesWorkList.removeAt(index);
  }

  void updateCompleteCoursesWorkListAtIndex(
    int index,
    CourseWorkStruct Function(CourseWorkStruct) updateFn,
  ) {
    completeCoursesWorkList[index] = updateFn(_completeCoursesWorkList[index]);
  }

  void insertAtIndexInCompleteCoursesWorkList(
      int index, CourseWorkStruct value) {
    completeCoursesWorkList.insert(index, value);
  }

  List<CoursesStruct> _coursesSimplelist = [];
  List<CoursesStruct> get coursesSimplelist => _coursesSimplelist;
  set coursesSimplelist(List<CoursesStruct> value) {
    _coursesSimplelist = value;
  }

  void addToCoursesSimplelist(CoursesStruct value) {
    coursesSimplelist.add(value);
  }

  void removeFromCoursesSimplelist(CoursesStruct value) {
    coursesSimplelist.remove(value);
  }

  void removeAtIndexFromCoursesSimplelist(int index) {
    coursesSimplelist.removeAt(index);
  }

  void updateCoursesSimplelistAtIndex(
    int index,
    CoursesStruct Function(CoursesStruct) updateFn,
  ) {
    coursesSimplelist[index] = updateFn(_coursesSimplelist[index]);
  }

  void insertAtIndexInCoursesSimplelist(int index, CoursesStruct value) {
    coursesSimplelist.insert(index, value);
  }

  List<CoursesStruct> _coursesPreviewList = [];
  List<CoursesStruct> get coursesPreviewList => _coursesPreviewList;
  set coursesPreviewList(List<CoursesStruct> value) {
    _coursesPreviewList = value;
  }

  void addToCoursesPreviewList(CoursesStruct value) {
    coursesPreviewList.add(value);
  }

  void removeFromCoursesPreviewList(CoursesStruct value) {
    coursesPreviewList.remove(value);
  }

  void removeAtIndexFromCoursesPreviewList(int index) {
    coursesPreviewList.removeAt(index);
  }

  void updateCoursesPreviewListAtIndex(
    int index,
    CoursesStruct Function(CoursesStruct) updateFn,
  ) {
    coursesPreviewList[index] = updateFn(_coursesPreviewList[index]);
  }

  void insertAtIndexInCoursesPreviewList(int index, CoursesStruct value) {
    coursesPreviewList.insert(index, value);
  }

  List<CourseWorkStruct> _completeCoursesWorkList2 = [];
  List<CourseWorkStruct> get completeCoursesWorkList2 =>
      _completeCoursesWorkList2;
  set completeCoursesWorkList2(List<CourseWorkStruct> value) {
    _completeCoursesWorkList2 = value;
  }

  void addToCompleteCoursesWorkList2(CourseWorkStruct value) {
    completeCoursesWorkList2.add(value);
  }

  void removeFromCompleteCoursesWorkList2(CourseWorkStruct value) {
    completeCoursesWorkList2.remove(value);
  }

  void removeAtIndexFromCompleteCoursesWorkList2(int index) {
    completeCoursesWorkList2.removeAt(index);
  }

  void updateCompleteCoursesWorkList2AtIndex(
    int index,
    CourseWorkStruct Function(CourseWorkStruct) updateFn,
  ) {
    completeCoursesWorkList2[index] =
        updateFn(_completeCoursesWorkList2[index]);
  }

  void insertAtIndexInCompleteCoursesWorkList2(
      int index, CourseWorkStruct value) {
    completeCoursesWorkList2.insert(index, value);
  }

  bool _loadingAnimationAction = false;
  bool get loadingAnimationAction => _loadingAnimationAction;
  set loadingAnimationAction(bool value) {
    _loadingAnimationAction = value;
  }

  List<CourseWorkStruct> _coursesWorkList3 = [];
  List<CourseWorkStruct> get coursesWorkList3 => _coursesWorkList3;
  set coursesWorkList3(List<CourseWorkStruct> value) {
    _coursesWorkList3 = value;
  }

  void addToCoursesWorkList3(CourseWorkStruct value) {
    coursesWorkList3.add(value);
  }

  void removeFromCoursesWorkList3(CourseWorkStruct value) {
    coursesWorkList3.remove(value);
  }

  void removeAtIndexFromCoursesWorkList3(int index) {
    coursesWorkList3.removeAt(index);
  }

  void updateCoursesWorkList3AtIndex(
    int index,
    CourseWorkStruct Function(CourseWorkStruct) updateFn,
  ) {
    coursesWorkList3[index] = updateFn(_coursesWorkList3[index]);
  }

  void insertAtIndexInCoursesWorkList3(int index, CourseWorkStruct value) {
    coursesWorkList3.insert(index, value);
  }

  DocumentReference? _studenLoadingReference;
  DocumentReference? get studenLoadingReference => _studenLoadingReference;
  set studenLoadingReference(DocumentReference? value) {
    _studenLoadingReference = value;
  }

  int _actionStudents = 0;
  int get actionStudents => _actionStudents;
  set actionStudents(int value) {
    _actionStudents = value;
  }

  bool _action2 = false;
  bool get action2 => _action2;
  set action2(bool value) {
    _action2 = value;
  }

  String _tknAt1 = '';
  String get tknAt1 => _tknAt1;
  set tknAt1(String value) {
    _tknAt1 = value;
  }

  DocumentReference? _qr;
  DocumentReference? get qr => _qr;
  set qr(DocumentReference? value) {
    _qr = value;
  }

  int _weeksFilter = 4;
  int get weeksFilter => _weeksFilter;
  set weeksFilter(int value) {
    _weeksFilter = value;
    prefs.setInt('ff_weeksFilter', value);
  }

  bool _initialAlertDialog1 = false;
  bool get initialAlertDialog1 => _initialAlertDialog1;
  set initialAlertDialog1(bool value) {
    _initialAlertDialog1 = value;
    prefs.setBool('ff_initialAlertDialog1', value);
  }

  bool _studenWalkTrough = false;
  bool get studenWalkTrough => _studenWalkTrough;
  set studenWalkTrough(bool value) {
    _studenWalkTrough = value;
    prefs.setBool('ff_studenWalkTrough', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
