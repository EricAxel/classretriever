// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialsStruct extends FFFirebaseStruct {
  MaterialsStruct({
    LinkStruct? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _link = link,
        super(firestoreUtilData);

  // "link" field.
  LinkStruct? _link;
  LinkStruct get link => _link ?? LinkStruct();
  set link(LinkStruct? val) => _link = val;

  void updateLink(Function(LinkStruct) updateFn) {
    updateFn(_link ??= LinkStruct());
  }

  bool hasLink() => _link != null;

  static MaterialsStruct fromMap(Map<String, dynamic> data) => MaterialsStruct(
        link: data['link'] is LinkStruct
            ? data['link']
            : LinkStruct.maybeFromMap(data['link']),
      );

  static MaterialsStruct? maybeFromMap(dynamic data) => data is Map
      ? MaterialsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'link': _link?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'link': serializeParam(
          _link,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MaterialsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaterialsStruct(
        link: deserializeStructParam(
          data['link'],
          ParamType.DataStruct,
          false,
          structBuilder: LinkStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MaterialsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaterialsStruct && link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([link]);
}

MaterialsStruct createMaterialsStruct({
  LinkStruct? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MaterialsStruct(
      link: link ?? (clearUnsetFields ? LinkStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MaterialsStruct? updateMaterialsStruct(
  MaterialsStruct? materials, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    materials
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMaterialsStructData(
  Map<String, dynamic> firestoreData,
  MaterialsStruct? materials,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (materials == null) {
    return;
  }
  if (materials.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && materials.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final materialsData = getMaterialsFirestoreData(materials, forFieldValue);
  final nestedData = materialsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = materials.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMaterialsFirestoreData(
  MaterialsStruct? materials, [
  bool forFieldValue = false,
]) {
  if (materials == null) {
    return {};
  }
  final firestoreData = mapToFirestore(materials.toMap());

  // Handle nested data for "link" field.
  addLinkStructData(
    firestoreData,
    materials.hasLink() ? materials.link : null,
    'link',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(materials.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMaterialsListFirestoreData(
  List<MaterialsStruct>? materialss,
) =>
    materialss?.map((e) => getMaterialsFirestoreData(e, true)).toList() ?? [];
