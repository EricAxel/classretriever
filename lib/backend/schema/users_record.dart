import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  bool hasAvatar() => _avatar != null;

  // "notification_settings" field.
  List<String>? _notificationSettings;
  List<String> get notificationSettings => _notificationSettings ?? const [];
  bool hasNotificationSettings() => _notificationSettings != null;

  // "notification_email" field.
  bool? _notificationEmail;
  bool get notificationEmail => _notificationEmail ?? false;
  bool hasNotificationEmail() => _notificationEmail != null;

  // "notification_text" field.
  bool? _notificationText;
  bool get notificationText => _notificationText ?? false;
  bool hasNotificationText() => _notificationText != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "subscription_status" field.
  bool? _subscriptionStatus;
  bool get subscriptionStatus => _subscriptionStatus ?? false;
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  // "next_billing_date" field.
  DateTime? _nextBillingDate;
  DateTime? get nextBillingDate => _nextBillingDate;
  bool hasNextBillingDate() => _nextBillingDate != null;

  // "next_billing_amt" field.
  double? _nextBillingAmt;
  double get nextBillingAmt => _nextBillingAmt ?? 0.0;
  bool hasNextBillingAmt() => _nextBillingAmt != null;

  // "lead_source" field.
  List<String>? _leadSource;
  List<String> get leadSource => _leadSource ?? const [];
  bool hasLeadSource() => _leadSource != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _avatar = snapshotData['avatar'] as String?;
    _notificationSettings = getDataList(snapshotData['notification_settings']);
    _notificationEmail = snapshotData['notification_email'] as bool?;
    _notificationText = snapshotData['notification_text'] as bool?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _subscriptionStatus = snapshotData['subscription_status'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _students = getDataList(snapshotData['students']);
    _nextBillingDate = snapshotData['next_billing_date'] as DateTime?;
    _nextBillingAmt = castToType<double>(snapshotData['next_billing_amt']);
    _leadSource = getDataList(snapshotData['lead_source']);
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? avatar,
  bool? notificationEmail,
  bool? notificationText,
  DateTime? dateOfBirth,
  bool? subscriptionStatus,
  DateTime? createdTime,
  DateTime? updatedTime,
  DateTime? nextBillingDate,
  double? nextBillingAmt,
  String? displayName,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'notification_email': notificationEmail,
      'notification_text': notificationText,
      'date_of_birth': dateOfBirth,
      'subscription_status': subscriptionStatus,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'next_billing_date': nextBillingDate,
      'next_billing_amt': nextBillingAmt,
      'display_name': displayName,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.avatar == e2?.avatar &&
        listEquality.equals(
            e1?.notificationSettings, e2?.notificationSettings) &&
        e1?.notificationEmail == e2?.notificationEmail &&
        e1?.notificationText == e2?.notificationText &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.subscriptionStatus == e2?.subscriptionStatus &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        listEquality.equals(e1?.students, e2?.students) &&
        e1?.nextBillingDate == e2?.nextBillingDate &&
        e1?.nextBillingAmt == e2?.nextBillingAmt &&
        listEquality.equals(e1?.leadSource, e2?.leadSource) &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.phoneNumber,
        e?.firstName,
        e?.lastName,
        e?.avatar,
        e?.notificationSettings,
        e?.notificationEmail,
        e?.notificationText,
        e?.dateOfBirth,
        e?.subscriptionStatus,
        e?.createdTime,
        e?.updatedTime,
        e?.students,
        e?.nextBillingDate,
        e?.nextBillingAmt,
        e?.leadSource,
        e?.displayName,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
