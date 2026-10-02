import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrRecord extends FirestoreRecord {
  QrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "complete" field.
  bool? _complete;
  bool get complete => _complete ?? false;
  bool hasComplete() => _complete != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _complete = snapshotData['complete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qr');

  static Stream<QrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrRecord.fromSnapshot(s));

  static Future<QrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrRecord.fromSnapshot(s));

  static QrRecord fromSnapshot(DocumentSnapshot snapshot) => QrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrRecordData({
  String? url,
  DateTime? time,
  bool? status,
  bool? complete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'time': time,
      'status': status,
      'complete': complete,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrRecordDocumentEquality implements Equality<QrRecord> {
  const QrRecordDocumentEquality();

  @override
  bool equals(QrRecord? e1, QrRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.time == e2?.time &&
        e1?.status == e2?.status &&
        e1?.complete == e2?.complete;
  }

  @override
  int hash(QrRecord? e) =>
      const ListEquality().hash([e?.url, e?.time, e?.status, e?.complete]);

  @override
  bool isValidKey(Object? o) => o is QrRecord;
}
