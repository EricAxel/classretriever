// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestresponseStruct extends FFFirebaseStruct {
  TestresponseStruct({
    String? name,
    int? integerr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _integerr = integerr,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "integerr" field.
  int? _integerr;
  int get integerr => _integerr ?? 0;
  set integerr(int? val) => _integerr = val;

  void incrementIntegerr(int amount) => integerr = integerr + amount;

  bool hasIntegerr() => _integerr != null;

  static TestresponseStruct fromMap(Map<String, dynamic> data) =>
      TestresponseStruct(
        name: data['name'] as String?,
        integerr: castToType<int>(data['integerr']),
      );

  static TestresponseStruct? maybeFromMap(dynamic data) => data is Map
      ? TestresponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'integerr': _integerr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'integerr': serializeParam(
          _integerr,
          ParamType.int,
        ),
      }.withoutNulls;

  static TestresponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestresponseStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        integerr: deserializeParam(
          data['integerr'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TestresponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestresponseStruct &&
        name == other.name &&
        integerr == other.integerr;
  }

  @override
  int get hashCode => const ListEquality().hash([name, integerr]);
}

TestresponseStruct createTestresponseStruct({
  String? name,
  int? integerr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestresponseStruct(
      name: name,
      integerr: integerr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestresponseStruct? updateTestresponseStruct(
  TestresponseStruct? testresponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testresponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestresponseStructData(
  Map<String, dynamic> firestoreData,
  TestresponseStruct? testresponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testresponse == null) {
    return;
  }
  if (testresponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && testresponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testresponseData =
      getTestresponseFirestoreData(testresponse, forFieldValue);
  final nestedData =
      testresponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = testresponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestresponseFirestoreData(
  TestresponseStruct? testresponse, [
  bool forFieldValue = false,
]) {
  if (testresponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testresponse.toMap());

  // Add any Firestore field values
  mapToFirestore(testresponse.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestresponseListFirestoreData(
  List<TestresponseStruct>? testresponses,
) =>
    testresponses?.map((e) => getTestresponseFirestoreData(e, true)).toList() ??
    [];
