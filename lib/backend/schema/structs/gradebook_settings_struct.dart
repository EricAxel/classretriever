// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradebookSettingsStruct extends FFFirebaseStruct {
  GradebookSettingsStruct({
    String? calculationType,
    String? displaySetting,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calculationType = calculationType,
        _displaySetting = displaySetting,
        super(firestoreUtilData);

  // "calculationType" field.
  String? _calculationType;
  String get calculationType => _calculationType ?? '';
  set calculationType(String? val) => _calculationType = val;

  bool hasCalculationType() => _calculationType != null;

  // "displaySetting" field.
  String? _displaySetting;
  String get displaySetting => _displaySetting ?? '';
  set displaySetting(String? val) => _displaySetting = val;

  bool hasDisplaySetting() => _displaySetting != null;

  static GradebookSettingsStruct fromMap(Map<String, dynamic> data) =>
      GradebookSettingsStruct(
        calculationType: data['calculationType'] as String?,
        displaySetting: data['displaySetting'] as String?,
      );

  static GradebookSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? GradebookSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'calculationType': _calculationType,
        'displaySetting': _displaySetting,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'calculationType': serializeParam(
          _calculationType,
          ParamType.String,
        ),
        'displaySetting': serializeParam(
          _displaySetting,
          ParamType.String,
        ),
      }.withoutNulls;

  static GradebookSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GradebookSettingsStruct(
        calculationType: deserializeParam(
          data['calculationType'],
          ParamType.String,
          false,
        ),
        displaySetting: deserializeParam(
          data['displaySetting'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GradebookSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GradebookSettingsStruct &&
        calculationType == other.calculationType &&
        displaySetting == other.displaySetting;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([calculationType, displaySetting]);
}

GradebookSettingsStruct createGradebookSettingsStruct({
  String? calculationType,
  String? displaySetting,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GradebookSettingsStruct(
      calculationType: calculationType,
      displaySetting: displaySetting,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GradebookSettingsStruct? updateGradebookSettingsStruct(
  GradebookSettingsStruct? gradebookSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gradebookSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGradebookSettingsStructData(
  Map<String, dynamic> firestoreData,
  GradebookSettingsStruct? gradebookSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gradebookSettings == null) {
    return;
  }
  if (gradebookSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gradebookSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gradebookSettingsData =
      getGradebookSettingsFirestoreData(gradebookSettings, forFieldValue);
  final nestedData =
      gradebookSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gradebookSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGradebookSettingsFirestoreData(
  GradebookSettingsStruct? gradebookSettings, [
  bool forFieldValue = false,
]) {
  if (gradebookSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gradebookSettings.toMap());

  // Add any Firestore field values
  mapToFirestore(gradebookSettings.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGradebookSettingsListFirestoreData(
  List<GradebookSettingsStruct>? gradebookSettingss,
) =>
    gradebookSettingss
        ?.map((e) => getGradebookSettingsFirestoreData(e, true))
        .toList() ??
    [];
