// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentSubmissionslistStruct extends FFFirebaseStruct {
  StudentSubmissionslistStruct({
    List<StudentSubmissionsStruct>? studentSubmissions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _studentSubmissions = studentSubmissions,
        super(firestoreUtilData);

  // "studentSubmissions" field.
  List<StudentSubmissionsStruct>? _studentSubmissions;
  List<StudentSubmissionsStruct> get studentSubmissions =>
      _studentSubmissions ?? const [];
  set studentSubmissions(List<StudentSubmissionsStruct>? val) =>
      _studentSubmissions = val;

  void updateStudentSubmissions(
      Function(List<StudentSubmissionsStruct>) updateFn) {
    updateFn(_studentSubmissions ??= []);
  }

  bool hasStudentSubmissions() => _studentSubmissions != null;

  static StudentSubmissionslistStruct fromMap(Map<String, dynamic> data) =>
      StudentSubmissionslistStruct(
        studentSubmissions: getStructList(
          data['studentSubmissions'],
          StudentSubmissionsStruct.fromMap,
        ),
      );

  static StudentSubmissionslistStruct? maybeFromMap(dynamic data) => data is Map
      ? StudentSubmissionslistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'studentSubmissions':
            _studentSubmissions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'studentSubmissions': serializeParam(
          _studentSubmissions,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static StudentSubmissionslistStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StudentSubmissionslistStruct(
        studentSubmissions: deserializeStructParam<StudentSubmissionsStruct>(
          data['studentSubmissions'],
          ParamType.DataStruct,
          true,
          structBuilder: StudentSubmissionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudentSubmissionslistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StudentSubmissionslistStruct &&
        listEquality.equals(studentSubmissions, other.studentSubmissions);
  }

  @override
  int get hashCode => const ListEquality().hash([studentSubmissions]);
}

StudentSubmissionslistStruct createStudentSubmissionslistStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StudentSubmissionslistStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StudentSubmissionslistStruct? updateStudentSubmissionslistStruct(
  StudentSubmissionslistStruct? studentSubmissionslist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    studentSubmissionslist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStudentSubmissionslistStructData(
  Map<String, dynamic> firestoreData,
  StudentSubmissionslistStruct? studentSubmissionslist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (studentSubmissionslist == null) {
    return;
  }
  if (studentSubmissionslist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      studentSubmissionslist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final studentSubmissionslistData = getStudentSubmissionslistFirestoreData(
      studentSubmissionslist, forFieldValue);
  final nestedData =
      studentSubmissionslistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      studentSubmissionslist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStudentSubmissionslistFirestoreData(
  StudentSubmissionslistStruct? studentSubmissionslist, [
  bool forFieldValue = false,
]) {
  if (studentSubmissionslist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(studentSubmissionslist.toMap());

  // Add any Firestore field values
  mapToFirestore(studentSubmissionslist.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStudentSubmissionslistListFirestoreData(
  List<StudentSubmissionslistStruct>? studentSubmissionslists,
) =>
    studentSubmissionslists
        ?.map((e) => getStudentSubmissionslistFirestoreData(e, true))
        .toList() ??
    [];
