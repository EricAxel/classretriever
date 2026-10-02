import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentsRecord extends FirestoreRecord {
  StudentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "student_given_name" field.
  String? _studentGivenName;
  String get studentGivenName => _studentGivenName ?? '';
  bool hasStudentGivenName() => _studentGivenName != null;

  // "student_family_name" field.
  String? _studentFamilyName;
  String get studentFamilyName => _studentFamilyName ?? '';
  bool hasStudentFamilyName() => _studentFamilyName != null;

  // "student_avatar" field.
  String? _studentAvatar;
  String get studentAvatar => _studentAvatar ?? '';
  bool hasStudentAvatar() => _studentAvatar != null;

  // "student_notification_settings" field.
  List<String>? _studentNotificationSettings;
  List<String> get studentNotificationSettings =>
      _studentNotificationSettings ?? const [];
  bool hasStudentNotificationSettings() => _studentNotificationSettings != null;

  // "student_notification_email" field.
  bool? _studentNotificationEmail;
  bool get studentNotificationEmail => _studentNotificationEmail ?? false;
  bool hasStudentNotificationEmail() => _studentNotificationEmail != null;

  // "student_personal_email" field.
  String? _studentPersonalEmail;
  String get studentPersonalEmail => _studentPersonalEmail ?? '';
  bool hasStudentPersonalEmail() => _studentPersonalEmail != null;

  // "student_notification_text" field.
  bool? _studentNotificationText;
  bool get studentNotificationText => _studentNotificationText ?? false;
  bool hasStudentNotificationText() => _studentNotificationText != null;

  // "student_personal_cell" field.
  String? _studentPersonalCell;
  String get studentPersonalCell => _studentPersonalCell ?? '';
  bool hasStudentPersonalCell() => _studentPersonalCell != null;

  // "student_school_email" field.
  String? _studentSchoolEmail;
  String get studentSchoolEmail => _studentSchoolEmail ?? '';
  bool hasStudentSchoolEmail() => _studentSchoolEmail != null;

  // "list_of_courses" field.
  List<DocumentReference>? _listOfCourses;
  List<DocumentReference> get listOfCourses => _listOfCourses ?? const [];
  bool hasListOfCourses() => _listOfCourses != null;

  // "google_token" field.
  String? _googleToken;
  String get googleToken => _googleToken ?? '';
  bool hasGoogleToken() => _googleToken != null;

  // "user_relation" field.
  String? _userRelation;
  String get userRelation => _userRelation ?? '';
  bool hasUserRelation() => _userRelation != null;

  // "google_classroom_connected" field.
  bool? _googleClassroomConnected;
  bool get googleClassroomConnected => _googleClassroomConnected ?? false;
  bool hasGoogleClassroomConnected() => _googleClassroomConnected != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "google_refresh_token" field.
  String? _googleRefreshToken;
  String get googleRefreshToken => _googleRefreshToken ?? '';
  bool hasGoogleRefreshToken() => _googleRefreshToken != null;

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "users_uids" field.
  List<String>? _usersUids;
  List<String> get usersUids => _usersUids ?? const [];
  bool hasUsersUids() => _usersUids != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _studentGivenName = snapshotData['student_given_name'] as String?;
    _studentFamilyName = snapshotData['student_family_name'] as String?;
    _studentAvatar = snapshotData['student_avatar'] as String?;
    _studentNotificationSettings =
        getDataList(snapshotData['student_notification_settings']);
    _studentNotificationEmail =
        snapshotData['student_notification_email'] as bool?;
    _studentPersonalEmail = snapshotData['student_personal_email'] as String?;
    _studentNotificationText =
        snapshotData['student_notification_text'] as bool?;
    _studentPersonalCell = snapshotData['student_personal_cell'] as String?;
    _studentSchoolEmail = snapshotData['student_school_email'] as String?;
    _listOfCourses = getDataList(snapshotData['list_of_courses']);
    _googleToken = snapshotData['google_token'] as String?;
    _userRelation = snapshotData['user_relation'] as String?;
    _googleClassroomConnected =
        snapshotData['google_classroom_connected'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _googleRefreshToken = snapshotData['google_refresh_token'] as String?;
    _userUid = snapshotData['user_uid'] as String?;
    _email = snapshotData['email'] as String?;
    _usersUids = getDataList(snapshotData['users_uids']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentsRecord.fromSnapshot(s));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentsRecord.fromSnapshot(s));

  static StudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentsRecordData({
  DocumentReference? userId,
  String? studentGivenName,
  String? studentFamilyName,
  String? studentAvatar,
  bool? studentNotificationEmail,
  String? studentPersonalEmail,
  bool? studentNotificationText,
  String? studentPersonalCell,
  String? studentSchoolEmail,
  String? googleToken,
  String? userRelation,
  bool? googleClassroomConnected,
  DateTime? createdTime,
  DateTime? updatedTime,
  String? googleRefreshToken,
  String? userUid,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'student_given_name': studentGivenName,
      'student_family_name': studentFamilyName,
      'student_avatar': studentAvatar,
      'student_notification_email': studentNotificationEmail,
      'student_personal_email': studentPersonalEmail,
      'student_notification_text': studentNotificationText,
      'student_personal_cell': studentPersonalCell,
      'student_school_email': studentSchoolEmail,
      'google_token': googleToken,
      'user_relation': userRelation,
      'google_classroom_connected': googleClassroomConnected,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'google_refresh_token': googleRefreshToken,
      'user_uid': userUid,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentsRecordDocumentEquality implements Equality<StudentsRecord> {
  const StudentsRecordDocumentEquality();

  @override
  bool equals(StudentsRecord? e1, StudentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.studentGivenName == e2?.studentGivenName &&
        e1?.studentFamilyName == e2?.studentFamilyName &&
        e1?.studentAvatar == e2?.studentAvatar &&
        listEquality.equals(
            e1?.studentNotificationSettings, e2?.studentNotificationSettings) &&
        e1?.studentNotificationEmail == e2?.studentNotificationEmail &&
        e1?.studentPersonalEmail == e2?.studentPersonalEmail &&
        e1?.studentNotificationText == e2?.studentNotificationText &&
        e1?.studentPersonalCell == e2?.studentPersonalCell &&
        e1?.studentSchoolEmail == e2?.studentSchoolEmail &&
        listEquality.equals(e1?.listOfCourses, e2?.listOfCourses) &&
        e1?.googleToken == e2?.googleToken &&
        e1?.userRelation == e2?.userRelation &&
        e1?.googleClassroomConnected == e2?.googleClassroomConnected &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.googleRefreshToken == e2?.googleRefreshToken &&
        e1?.userUid == e2?.userUid &&
        e1?.email == e2?.email &&
        listEquality.equals(e1?.usersUids, e2?.usersUids);
  }

  @override
  int hash(StudentsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.studentGivenName,
        e?.studentFamilyName,
        e?.studentAvatar,
        e?.studentNotificationSettings,
        e?.studentNotificationEmail,
        e?.studentPersonalEmail,
        e?.studentNotificationText,
        e?.studentPersonalCell,
        e?.studentSchoolEmail,
        e?.listOfCourses,
        e?.googleToken,
        e?.userRelation,
        e?.googleClassroomConnected,
        e?.createdTime,
        e?.updatedTime,
        e?.googleRefreshToken,
        e?.userUid,
        e?.email,
        e?.usersUids
      ]);

  @override
  bool isValidKey(Object? o) => o is StudentsRecord;
}
