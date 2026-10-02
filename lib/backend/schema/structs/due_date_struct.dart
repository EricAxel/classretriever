// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DueDateStruct extends FFFirebaseStruct {
  DueDateStruct({
    int? year,
    int? month,
    int? day,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _year = year,
        _month = month,
        _day = day,
        super(firestoreUtilData);

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  set month(int? val) => _month = val;

  void incrementMonth(int amount) => month = month + amount;

  bool hasMonth() => _month != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;

  void incrementDay(int amount) => day = day + amount;

  bool hasDay() => _day != null;

  static DueDateStruct fromMap(Map<String, dynamic> data) => DueDateStruct(
        year: castToType<int>(data['year']),
        month: castToType<int>(data['month']),
        day: castToType<int>(data['day']),
      );

  static DueDateStruct? maybeFromMap(dynamic data) =>
      data is Map ? DueDateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'year': _year,
        'month': _month,
        'day': _day,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'month': serializeParam(
          _month,
          ParamType.int,
        ),
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
      }.withoutNulls;

  static DueDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DueDateStruct(
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.int,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DueDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DueDateStruct &&
        year == other.year &&
        month == other.month &&
        day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([year, month, day]);
}

DueDateStruct createDueDateStruct({
  int? year,
  int? month,
  int? day,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DueDateStruct(
      year: year,
      month: month,
      day: day,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DueDateStruct? updateDueDateStruct(
  DueDateStruct? dueDate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dueDate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDueDateStructData(
  Map<String, dynamic> firestoreData,
  DueDateStruct? dueDate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dueDate == null) {
    return;
  }
  if (dueDate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dueDate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dueDateData = getDueDateFirestoreData(dueDate, forFieldValue);
  final nestedData = dueDateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dueDate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDueDateFirestoreData(
  DueDateStruct? dueDate, [
  bool forFieldValue = false,
]) {
  if (dueDate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dueDate.toMap());

  // Add any Firestore field values
  mapToFirestore(dueDate.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDueDateListFirestoreData(
  List<DueDateStruct>? dueDates,
) =>
    dueDates?.map((e) => getDueDateFirestoreData(e, true)).toList() ?? [];
