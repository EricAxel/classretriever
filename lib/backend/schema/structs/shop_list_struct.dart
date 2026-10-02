// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopListStruct extends FFFirebaseStruct {
  ShopListStruct({
    String? image,
    String? name,
    String? description,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _name = name,
        _description = description,
        _price = price,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static ShopListStruct fromMap(Map<String, dynamic> data) => ShopListStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
      );

  static ShopListStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShopListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'description': _description,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static ShopListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopListStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ShopListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopListStruct &&
        image == other.image &&
        name == other.name &&
        description == other.description &&
        price == other.price;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, name, description, price]);
}

ShopListStruct createShopListStruct({
  String? image,
  String? name,
  String? description,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShopListStruct(
      image: image,
      name: name,
      description: description,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShopListStruct? updateShopListStruct(
  ShopListStruct? shopList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shopList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShopListStructData(
  Map<String, dynamic> firestoreData,
  ShopListStruct? shopList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shopList == null) {
    return;
  }
  if (shopList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shopList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shopListData = getShopListFirestoreData(shopList, forFieldValue);
  final nestedData = shopListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shopList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShopListFirestoreData(
  ShopListStruct? shopList, [
  bool forFieldValue = false,
]) {
  if (shopList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shopList.toMap());

  // Add any Firestore field values
  mapToFirestore(shopList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShopListListFirestoreData(
  List<ShopListStruct>? shopLists,
) =>
    shopLists?.map((e) => getShopListFirestoreData(e, true)).toList() ?? [];
