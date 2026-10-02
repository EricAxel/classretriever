// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentSubmissionStruct extends FFFirebaseStruct {
  AssignmentSubmissionStruct({
    String? empty,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _empty = empty,
        super(firestoreUtilData);

  // "empty" field.
  String? _empty;
  String get empty => _empty ?? '';
  set empty(String? val) => _empty = val;

  bool hasEmpty() => _empty != null;

  static AssignmentSubmissionStruct fromMap(Map<String, dynamic> data) =>
      AssignmentSubmissionStruct(
        empty: data['empty'] as String?,
      );

  static AssignmentSubmissionStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignmentSubmissionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'empty': _empty,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'empty': serializeParam(
          _empty,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssignmentSubmissionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AssignmentSubmissionStruct(
        empty: deserializeParam(
          data['empty'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssignmentSubmissionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignmentSubmissionStruct && empty == other.empty;
  }

  @override
  int get hashCode => const ListEquality().hash([empty]);
}

AssignmentSubmissionStruct createAssignmentSubmissionStruct({
  String? empty,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AssignmentSubmissionStruct(
      empty: empty,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AssignmentSubmissionStruct? updateAssignmentSubmissionStruct(
  AssignmentSubmissionStruct? assignmentSubmission, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    assignmentSubmission
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAssignmentSubmissionStructData(
  Map<String, dynamic> firestoreData,
  AssignmentSubmissionStruct? assignmentSubmission,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (assignmentSubmission == null) {
    return;
  }
  if (assignmentSubmission.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && assignmentSubmission.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final assignmentSubmissionData =
      getAssignmentSubmissionFirestoreData(assignmentSubmission, forFieldValue);
  final nestedData =
      assignmentSubmissionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      assignmentSubmission.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAssignmentSubmissionFirestoreData(
  AssignmentSubmissionStruct? assignmentSubmission, [
  bool forFieldValue = false,
]) {
  if (assignmentSubmission == null) {
    return {};
  }
  final firestoreData = mapToFirestore(assignmentSubmission.toMap());

  // Add any Firestore field values
  mapToFirestore(assignmentSubmission.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAssignmentSubmissionListFirestoreData(
  List<AssignmentSubmissionStruct>? assignmentSubmissions,
) =>
    assignmentSubmissions
        ?.map((e) => getAssignmentSubmissionFirestoreData(e, true))
        .toList() ??
    [];
