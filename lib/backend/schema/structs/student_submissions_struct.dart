// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentSubmissionsStruct extends FFFirebaseStruct {
  StudentSubmissionsStruct({
    String? courseId,
    String? courseWorkId,
    String? id,
    String? userId,
    String? state,
    String? alternateLink,
    String? courseWorkType,
    AssignmentSubmissionStruct? assignmentSubmission,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseId = courseId,
        _courseWorkId = courseWorkId,
        _id = id,
        _userId = userId,
        _state = state,
        _alternateLink = alternateLink,
        _courseWorkType = courseWorkType,
        _assignmentSubmission = assignmentSubmission,
        super(firestoreUtilData);

  // "courseId" field.
  String? _courseId;
  String get courseId => _courseId ?? '';
  set courseId(String? val) => _courseId = val;

  bool hasCourseId() => _courseId != null;

  // "courseWorkId" field.
  String? _courseWorkId;
  String get courseWorkId => _courseWorkId ?? '';
  set courseWorkId(String? val) => _courseWorkId = val;

  bool hasCourseWorkId() => _courseWorkId != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "alternateLink" field.
  String? _alternateLink;
  String get alternateLink => _alternateLink ?? '';
  set alternateLink(String? val) => _alternateLink = val;

  bool hasAlternateLink() => _alternateLink != null;

  // "courseWorkType" field.
  String? _courseWorkType;
  String get courseWorkType => _courseWorkType ?? '';
  set courseWorkType(String? val) => _courseWorkType = val;

  bool hasCourseWorkType() => _courseWorkType != null;

  // "assignmentSubmission" field.
  AssignmentSubmissionStruct? _assignmentSubmission;
  AssignmentSubmissionStruct get assignmentSubmission =>
      _assignmentSubmission ?? AssignmentSubmissionStruct();
  set assignmentSubmission(AssignmentSubmissionStruct? val) =>
      _assignmentSubmission = val;

  void updateAssignmentSubmission(
      Function(AssignmentSubmissionStruct) updateFn) {
    updateFn(_assignmentSubmission ??= AssignmentSubmissionStruct());
  }

  bool hasAssignmentSubmission() => _assignmentSubmission != null;

  static StudentSubmissionsStruct fromMap(Map<String, dynamic> data) =>
      StudentSubmissionsStruct(
        courseId: data['courseId'] as String?,
        courseWorkId: data['courseWorkId'] as String?,
        id: data['id'] as String?,
        userId: data['userId'] as String?,
        state: data['state'] as String?,
        alternateLink: data['alternateLink'] as String?,
        courseWorkType: data['courseWorkType'] as String?,
        assignmentSubmission:
            data['assignmentSubmission'] is AssignmentSubmissionStruct
                ? data['assignmentSubmission']
                : AssignmentSubmissionStruct.maybeFromMap(
                    data['assignmentSubmission']),
      );

  static StudentSubmissionsStruct? maybeFromMap(dynamic data) => data is Map
      ? StudentSubmissionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseId': _courseId,
        'courseWorkId': _courseWorkId,
        'id': _id,
        'userId': _userId,
        'state': _state,
        'alternateLink': _alternateLink,
        'courseWorkType': _courseWorkType,
        'assignmentSubmission': _assignmentSubmission?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseId': serializeParam(
          _courseId,
          ParamType.String,
        ),
        'courseWorkId': serializeParam(
          _courseWorkId,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'alternateLink': serializeParam(
          _alternateLink,
          ParamType.String,
        ),
        'courseWorkType': serializeParam(
          _courseWorkType,
          ParamType.String,
        ),
        'assignmentSubmission': serializeParam(
          _assignmentSubmission,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StudentSubmissionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudentSubmissionsStruct(
        courseId: deserializeParam(
          data['courseId'],
          ParamType.String,
          false,
        ),
        courseWorkId: deserializeParam(
          data['courseWorkId'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        alternateLink: deserializeParam(
          data['alternateLink'],
          ParamType.String,
          false,
        ),
        courseWorkType: deserializeParam(
          data['courseWorkType'],
          ParamType.String,
          false,
        ),
        assignmentSubmission: deserializeStructParam(
          data['assignmentSubmission'],
          ParamType.DataStruct,
          false,
          structBuilder: AssignmentSubmissionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudentSubmissionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudentSubmissionsStruct &&
        courseId == other.courseId &&
        courseWorkId == other.courseWorkId &&
        id == other.id &&
        userId == other.userId &&
        state == other.state &&
        alternateLink == other.alternateLink &&
        courseWorkType == other.courseWorkType &&
        assignmentSubmission == other.assignmentSubmission;
  }

  @override
  int get hashCode => const ListEquality().hash([
        courseId,
        courseWorkId,
        id,
        userId,
        state,
        alternateLink,
        courseWorkType,
        assignmentSubmission
      ]);
}

StudentSubmissionsStruct createStudentSubmissionsStruct({
  String? courseId,
  String? courseWorkId,
  String? id,
  String? userId,
  String? state,
  String? alternateLink,
  String? courseWorkType,
  AssignmentSubmissionStruct? assignmentSubmission,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudentSubmissionsStruct(
      courseId: courseId,
      courseWorkId: courseWorkId,
      id: id,
      userId: userId,
      state: state,
      alternateLink: alternateLink,
      courseWorkType: courseWorkType,
      assignmentSubmission: assignmentSubmission ??
          (clearUnsetFields ? AssignmentSubmissionStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudentSubmissionsStruct? updateStudentSubmissionsStruct(
  StudentSubmissionsStruct? studentSubmissions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    studentSubmissions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudentSubmissionsStructData(
  Map<String, dynamic> firestoreData,
  StudentSubmissionsStruct? studentSubmissions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (studentSubmissions == null) {
    return;
  }
  if (studentSubmissions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && studentSubmissions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studentSubmissionsData =
      getStudentSubmissionsFirestoreData(studentSubmissions, forFieldValue);
  final nestedData =
      studentSubmissionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      studentSubmissions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudentSubmissionsFirestoreData(
  StudentSubmissionsStruct? studentSubmissions, [
  bool forFieldValue = false,
]) {
  if (studentSubmissions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(studentSubmissions.toMap());

  // Handle nested data for "assignmentSubmission" field.
  addAssignmentSubmissionStructData(
    firestoreData,
    studentSubmissions.hasAssignmentSubmission()
        ? studentSubmissions.assignmentSubmission
        : null,
    'assignmentSubmission',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(studentSubmissions.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudentSubmissionsListFirestoreData(
  List<StudentSubmissionsStruct>? studentSubmissionss,
) =>
    studentSubmissionss
        ?.map((e) => getStudentSubmissionsFirestoreData(e, true))
        .toList() ??
    [];
