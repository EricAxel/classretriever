import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokensRecord extends FirestoreRecord {
  TokensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refreshtoken" field.
  String? _refreshtoken;
  String get refreshtoken => _refreshtoken ?? '';
  bool hasRefreshtoken() => _refreshtoken != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _refreshtoken = snapshotData['refreshtoken'] as String?;
    _token = snapshotData['token'] as String?;
    _user = snapshotData['user'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tokens');

  static Stream<TokensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TokensRecord.fromSnapshot(s));

  static Future<TokensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TokensRecord.fromSnapshot(s));

  static TokensRecord fromSnapshot(DocumentSnapshot snapshot) => TokensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TokensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TokensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TokensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TokensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTokensRecordData({
  String? refreshtoken,
  String? token,
  String? user,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refreshtoken': refreshtoken,
      'token': token,
      'user': user,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TokensRecordDocumentEquality implements Equality<TokensRecord> {
  const TokensRecordDocumentEquality();

  @override
  bool equals(TokensRecord? e1, TokensRecord? e2) {
    return e1?.refreshtoken == e2?.refreshtoken &&
        e1?.token == e2?.token &&
        e1?.user == e2?.user &&
        e1?.name == e2?.name;
  }

  @override
  int hash(TokensRecord? e) =>
      const ListEquality().hash([e?.refreshtoken, e?.token, e?.user, e?.name]);

  @override
  bool isValidKey(Object? o) => o is TokensRecord;
}
