// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DueTimeStruct extends FFFirebaseStruct {
  DueTimeStruct({
    int? hours,
    int? minutes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hours = hours,
        _minutes = minutes,
        super(firestoreUtilData);

  // "hours" field.
  int? _hours;
  int get hours => _hours ?? 0;
  set hours(int? val) => _hours = val;

  void incrementHours(int amount) => hours = hours + amount;

  bool hasHours() => _hours != null;

  // "minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  set minutes(int? val) => _minutes = val;

  void incrementMinutes(int amount) => minutes = minutes + amount;

  bool hasMinutes() => _minutes != null;

  static DueTimeStruct fromMap(Map<String, dynamic> data) => DueTimeStruct(
        hours: castToType<int>(data['hours']),
        minutes: castToType<int>(data['minutes']),
      );

  static DueTimeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DueTimeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'hours': _hours,
        'minutes': _minutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hours': serializeParam(
          _hours,
          ParamType.int,
        ),
        'minutes': serializeParam(
          _minutes,
          ParamType.int,
        ),
      }.withoutNulls;

  static DueTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DueTimeStruct(
        hours: deserializeParam(
          data['hours'],
          ParamType.int,
          false,
        ),
        minutes: deserializeParam(
          data['minutes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DueTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DueTimeStruct &&
        hours == other.hours &&
        minutes == other.minutes;
  }

  @override
  int get hashCode => const ListEquality().hash([hours, minutes]);
}

DueTimeStruct createDueTimeStruct({
  int? hours,
  int? minutes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DueTimeStruct(
      hours: hours,
      minutes: minutes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DueTimeStruct? updateDueTimeStruct(
  DueTimeStruct? dueTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dueTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDueTimeStructData(
  Map<String, dynamic> firestoreData,
  DueTimeStruct? dueTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dueTime == null) {
    return;
  }
  if (dueTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dueTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dueTimeData = getDueTimeFirestoreData(dueTime, forFieldValue);
  final nestedData = dueTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dueTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDueTimeFirestoreData(
  DueTimeStruct? dueTime, [
  bool forFieldValue = false,
]) {
  if (dueTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dueTime.toMap());

  // Add any Firestore field values
  mapToFirestore(dueTime.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDueTimeListFirestoreData(
  List<DueTimeStruct>? dueTimes,
) =>
    dueTimes?.map((e) => getDueTimeFirestoreData(e, true)).toList() ?? [];
