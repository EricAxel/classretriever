// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesStruct extends FFFirebaseStruct {
  CoursesStruct({
    String? id,
    String? name,
    String? section,
    String? room,
    String? ownerId,
    String? creationTime,
    String? updateTime,
    String? courseState,
    String? alternateLink,
    String? teacherGroupEmail,
    String? courseGroupEmail,
    bool? guardiansEnabled,
    String? calendarId,
    GradebookSettingsStruct? gradebookSettings,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _section = section,
        _room = room,
        _ownerId = ownerId,
        _creationTime = creationTime,
        _updateTime = updateTime,
        _courseState = courseState,
        _alternateLink = alternateLink,
        _teacherGroupEmail = teacherGroupEmail,
        _courseGroupEmail = courseGroupEmail,
        _guardiansEnabled = guardiansEnabled,
        _calendarId = calendarId,
        _gradebookSettings = gradebookSettings,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  set section(String? val) => _section = val;

  bool hasSection() => _section != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  set room(String? val) => _room = val;

  bool hasRoom() => _room != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "creationTime" field.
  String? _creationTime;
  String get creationTime => _creationTime ?? '';
  set creationTime(String? val) => _creationTime = val;

  bool hasCreationTime() => _creationTime != null;

  // "updateTime" field.
  String? _updateTime;
  String get updateTime => _updateTime ?? '';
  set updateTime(String? val) => _updateTime = val;

  bool hasUpdateTime() => _updateTime != null;

  // "courseState" field.
  String? _courseState;
  String get courseState => _courseState ?? '';
  set courseState(String? val) => _courseState = val;

  bool hasCourseState() => _courseState != null;

  // "alternateLink" field.
  String? _alternateLink;
  String get alternateLink => _alternateLink ?? '';
  set alternateLink(String? val) => _alternateLink = val;

  bool hasAlternateLink() => _alternateLink != null;

  // "teacherGroupEmail" field.
  String? _teacherGroupEmail;
  String get teacherGroupEmail => _teacherGroupEmail ?? '';
  set teacherGroupEmail(String? val) => _teacherGroupEmail = val;

  bool hasTeacherGroupEmail() => _teacherGroupEmail != null;

  // "courseGroupEmail" field.
  String? _courseGroupEmail;
  String get courseGroupEmail => _courseGroupEmail ?? '';
  set courseGroupEmail(String? val) => _courseGroupEmail = val;

  bool hasCourseGroupEmail() => _courseGroupEmail != null;

  // "guardiansEnabled" field.
  bool? _guardiansEnabled;
  bool get guardiansEnabled => _guardiansEnabled ?? false;
  set guardiansEnabled(bool? val) => _guardiansEnabled = val;

  bool hasGuardiansEnabled() => _guardiansEnabled != null;

  // "calendarId" field.
  String? _calendarId;
  String get calendarId => _calendarId ?? '';
  set calendarId(String? val) => _calendarId = val;

  bool hasCalendarId() => _calendarId != null;

  // "gradebookSettings" field.
  GradebookSettingsStruct? _gradebookSettings;
  GradebookSettingsStruct get gradebookSettings =>
      _gradebookSettings ?? GradebookSettingsStruct();
  set gradebookSettings(GradebookSettingsStruct? val) =>
      _gradebookSettings = val;

  void updateGradebookSettings(Function(GradebookSettingsStruct) updateFn) {
    updateFn(_gradebookSettings ??= GradebookSettingsStruct());
  }

  bool hasGradebookSettings() => _gradebookSettings != null;

  static CoursesStruct fromMap(Map<String, dynamic> data) => CoursesStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        section: data['section'] as String?,
        room: data['room'] as String?,
        ownerId: data['ownerId'] as String?,
        creationTime: data['creationTime'] as String?,
        updateTime: data['updateTime'] as String?,
        courseState: data['courseState'] as String?,
        alternateLink: data['alternateLink'] as String?,
        teacherGroupEmail: data['teacherGroupEmail'] as String?,
        courseGroupEmail: data['courseGroupEmail'] as String?,
        guardiansEnabled: data['guardiansEnabled'] as bool?,
        calendarId: data['calendarId'] as String?,
        gradebookSettings: data['gradebookSettings'] is GradebookSettingsStruct
            ? data['gradebookSettings']
            : GradebookSettingsStruct.maybeFromMap(data['gradebookSettings']),
      );

  static CoursesStruct? maybeFromMap(dynamic data) =>
      data is Map ? CoursesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'section': _section,
        'room': _room,
        'ownerId': _ownerId,
        'creationTime': _creationTime,
        'updateTime': _updateTime,
        'courseState': _courseState,
        'alternateLink': _alternateLink,
        'teacherGroupEmail': _teacherGroupEmail,
        'courseGroupEmail': _courseGroupEmail,
        'guardiansEnabled': _guardiansEnabled,
        'calendarId': _calendarId,
        'gradebookSettings': _gradebookSettings?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'section': serializeParam(
          _section,
          ParamType.String,
        ),
        'room': serializeParam(
          _room,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'creationTime': serializeParam(
          _creationTime,
          ParamType.String,
        ),
        'updateTime': serializeParam(
          _updateTime,
          ParamType.String,
        ),
        'courseState': serializeParam(
          _courseState,
          ParamType.String,
        ),
        'alternateLink': serializeParam(
          _alternateLink,
          ParamType.String,
        ),
        'teacherGroupEmail': serializeParam(
          _teacherGroupEmail,
          ParamType.String,
        ),
        'courseGroupEmail': serializeParam(
          _courseGroupEmail,
          ParamType.String,
        ),
        'guardiansEnabled': serializeParam(
          _guardiansEnabled,
          ParamType.bool,
        ),
        'calendarId': serializeParam(
          _calendarId,
          ParamType.String,
        ),
        'gradebookSettings': serializeParam(
          _gradebookSettings,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CoursesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoursesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        section: deserializeParam(
          data['section'],
          ParamType.String,
          false,
        ),
        room: deserializeParam(
          data['room'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        creationTime: deserializeParam(
          data['creationTime'],
          ParamType.String,
          false,
        ),
        updateTime: deserializeParam(
          data['updateTime'],
          ParamType.String,
          false,
        ),
        courseState: deserializeParam(
          data['courseState'],
          ParamType.String,
          false,
        ),
        alternateLink: deserializeParam(
          data['alternateLink'],
          ParamType.String,
          false,
        ),
        teacherGroupEmail: deserializeParam(
          data['teacherGroupEmail'],
          ParamType.String,
          false,
        ),
        courseGroupEmail: deserializeParam(
          data['courseGroupEmail'],
          ParamType.String,
          false,
        ),
        guardiansEnabled: deserializeParam(
          data['guardiansEnabled'],
          ParamType.bool,
          false,
        ),
        calendarId: deserializeParam(
          data['calendarId'],
          ParamType.String,
          false,
        ),
        gradebookSettings: deserializeStructParam(
          data['gradebookSettings'],
          ParamType.DataStruct,
          false,
          structBuilder: GradebookSettingsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CoursesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoursesStruct &&
        id == other.id &&
        name == other.name &&
        section == other.section &&
        room == other.room &&
        ownerId == other.ownerId &&
        creationTime == other.creationTime &&
        updateTime == other.updateTime &&
        courseState == other.courseState &&
        alternateLink == other.alternateLink &&
        teacherGroupEmail == other.teacherGroupEmail &&
        courseGroupEmail == other.courseGroupEmail &&
        guardiansEnabled == other.guardiansEnabled &&
        calendarId == other.calendarId &&
        gradebookSettings == other.gradebookSettings;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        section,
        room,
        ownerId,
        creationTime,
        updateTime,
        courseState,
        alternateLink,
        teacherGroupEmail,
        courseGroupEmail,
        guardiansEnabled,
        calendarId,
        gradebookSettings
      ]);
}

CoursesStruct createCoursesStruct({
  String? id,
  String? name,
  String? section,
  String? room,
  String? ownerId,
  String? creationTime,
  String? updateTime,
  String? courseState,
  String? alternateLink,
  String? teacherGroupEmail,
  String? courseGroupEmail,
  bool? guardiansEnabled,
  String? calendarId,
  GradebookSettingsStruct? gradebookSettings,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoursesStruct(
      id: id,
      name: name,
      section: section,
      room: room,
      ownerId: ownerId,
      creationTime: creationTime,
      updateTime: updateTime,
      courseState: courseState,
      alternateLink: alternateLink,
      teacherGroupEmail: teacherGroupEmail,
      courseGroupEmail: courseGroupEmail,
      guardiansEnabled: guardiansEnabled,
      calendarId: calendarId,
      gradebookSettings: gradebookSettings ??
          (clearUnsetFields ? GradebookSettingsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoursesStruct? updateCoursesStruct(
  CoursesStruct? courses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoursesStructData(
  Map<String, dynamic> firestoreData,
  CoursesStruct? courses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courses == null) {
    return;
  }
  if (courses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coursesData = getCoursesFirestoreData(courses, forFieldValue);
  final nestedData = coursesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoursesFirestoreData(
  CoursesStruct? courses, [
  bool forFieldValue = false,
]) {
  if (courses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courses.toMap());

  // Handle nested data for "gradebookSettings" field.
  addGradebookSettingsStructData(
    firestoreData,
    courses.hasGradebookSettings() ? courses.gradebookSettings : null,
    'gradebookSettings',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(courses.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoursesListFirestoreData(
  List<CoursesStruct>? coursess,
) =>
    coursess?.map((e) => getCoursesFirestoreData(e, true)).toList() ?? [];
