// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthlyDataStruct extends FFFirebaseStruct {
  MonthlyDataStruct({
    String? month,
    double? total,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _month = month,
        _total = total,
        super(firestoreUtilData);

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static MonthlyDataStruct fromMap(Map<String, dynamic> data) =>
      MonthlyDataStruct(
        month: data['month'] as String?,
        total: castToType<double>(data['total']),
      );

  static MonthlyDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MonthlyDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
      }.withoutNulls;

  static MonthlyDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthlyDataStruct(
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MonthlyDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MonthlyDataStruct &&
        month == other.month &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([month, total]);
}

MonthlyDataStruct createMonthlyDataStruct({
  String? month,
  double? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MonthlyDataStruct(
      month: month,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MonthlyDataStruct? updateMonthlyDataStruct(
  MonthlyDataStruct? monthlyData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    monthlyData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMonthlyDataStructData(
  Map<String, dynamic> firestoreData,
  MonthlyDataStruct? monthlyData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (monthlyData == null) {
    return;
  }
  if (monthlyData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && monthlyData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final monthlyDataData =
      getMonthlyDataFirestoreData(monthlyData, forFieldValue);
  final nestedData =
      monthlyDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = monthlyData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMonthlyDataFirestoreData(
  MonthlyDataStruct? monthlyData, [
  bool forFieldValue = false,
]) {
  if (monthlyData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(monthlyData.toMap());

  // Add any Firestore field values
  mapToFirestore(monthlyData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMonthlyDataListFirestoreData(
  List<MonthlyDataStruct>? monthlyDatas,
) =>
    monthlyDatas?.map((e) => getMonthlyDataFirestoreData(e, true)).toList() ??
    [];
