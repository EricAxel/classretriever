// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinkStruct extends FFFirebaseStruct {
  LinkStruct({
    String? url,
    String? title,
    String? thumbnailUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        _title = title,
        _thumbnailUrl = thumbnailUrl,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "thumbnailUrl" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  set thumbnailUrl(String? val) => _thumbnailUrl = val;

  bool hasThumbnailUrl() => _thumbnailUrl != null;

  static LinkStruct fromMap(Map<String, dynamic> data) => LinkStruct(
        url: data['url'] as String?,
        title: data['title'] as String?,
        thumbnailUrl: data['thumbnailUrl'] as String?,
      );

  static LinkStruct? maybeFromMap(dynamic data) =>
      data is Map ? LinkStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'title': _title,
        'thumbnailUrl': _thumbnailUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'thumbnailUrl': serializeParam(
          _thumbnailUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkStruct fromSerializableMap(Map<String, dynamic> data) =>
      LinkStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        thumbnailUrl: deserializeParam(
          data['thumbnailUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LinkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkStruct &&
        url == other.url &&
        title == other.title &&
        thumbnailUrl == other.thumbnailUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([url, title, thumbnailUrl]);
}

LinkStruct createLinkStruct({
  String? url,
  String? title,
  String? thumbnailUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkStruct(
      url: url,
      title: title,
      thumbnailUrl: thumbnailUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkStruct? updateLinkStruct(
  LinkStruct? link, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    link
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkStructData(
  Map<String, dynamic> firestoreData,
  LinkStruct? link,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (link == null) {
    return;
  }
  if (link.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && link.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkData = getLinkFirestoreData(link, forFieldValue);
  final nestedData = linkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = link.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkFirestoreData(
  LinkStruct? link, [
  bool forFieldValue = false,
]) {
  if (link == null) {
    return {};
  }
  final firestoreData = mapToFirestore(link.toMap());

  // Add any Firestore field values
  mapToFirestore(link.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkListFirestoreData(
  List<LinkStruct>? links,
) =>
    links?.map((e) => getLinkFirestoreData(e, true)).toList() ?? [];
