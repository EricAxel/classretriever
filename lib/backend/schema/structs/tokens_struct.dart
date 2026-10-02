// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokensStruct extends FFFirebaseStruct {
  TokensStruct({
    String? accessToken,
    String? refreshToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToken = accessToken,
        _refreshToken = refreshToken,
        super(firestoreUtilData);

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  static TokensStruct fromMap(Map<String, dynamic> data) => TokensStruct(
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
      );

  static TokensStruct? maybeFromMap(dynamic data) =>
      data is Map ? TokensStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokensStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokensStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokensStruct &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode => const ListEquality().hash([accessToken, refreshToken]);
}

TokensStruct createTokensStruct({
  String? accessToken,
  String? refreshToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TokensStruct(
      accessToken: accessToken,
      refreshToken: refreshToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TokensStruct? updateTokensStruct(
  TokensStruct? tokens, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tokens
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTokensStructData(
  Map<String, dynamic> firestoreData,
  TokensStruct? tokens,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tokens == null) {
    return;
  }
  if (tokens.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tokens.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tokensData = getTokensFirestoreData(tokens, forFieldValue);
  final nestedData = tokensData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tokens.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTokensFirestoreData(
  TokensStruct? tokens, [
  bool forFieldValue = false,
]) {
  if (tokens == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tokens.toMap());

  // Add any Firestore field values
  mapToFirestore(tokens.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTokensListFirestoreData(
  List<TokensStruct>? tokenss,
) =>
    tokenss?.map((e) => getTokensFirestoreData(e, true)).toList() ?? [];
