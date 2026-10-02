import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseWorkRecord extends FirestoreRecord {
  CourseWorkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student_id" field.
  DocumentReference? _studentId;
  DocumentReference? get studentId => _studentId;
  bool hasStudentId() => _studentId != null;

  // "course_id" field.
  DocumentReference? _courseId;
  DocumentReference? get courseId => _courseId;
  bool hasCourseId() => _courseId != null;

  // "coursework" field.
  String? _coursework;
  String get coursework => _coursework ?? '';
  bool hasCoursework() => _coursework != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "due_time" field.
  DateTime? _dueTime;
  DateTime? get dueTime => _dueTime;
  bool hasDueTime() => _dueTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  void _initializeFields() {
    _studentId = snapshotData['student_id'] as DocumentReference?;
    _courseId = snapshotData['course_id'] as DocumentReference?;
    _coursework = snapshotData['coursework'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _state = snapshotData['state'] as String?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _dueTime = snapshotData['due_time'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courseWork');

  static Stream<CourseWorkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseWorkRecord.fromSnapshot(s));

  static Future<CourseWorkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseWorkRecord.fromSnapshot(s));

  static CourseWorkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseWorkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseWorkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseWorkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseWorkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseWorkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseWorkRecordData({
  DocumentReference? studentId,
  DocumentReference? courseId,
  String? coursework,
  String? title,
  String? description,
  String? state,
  DateTime? dueDate,
  DateTime? dueTime,
  DateTime? createdTime,
  DateTime? updatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student_id': studentId,
      'course_id': courseId,
      'coursework': coursework,
      'title': title,
      'description': description,
      'state': state,
      'due_date': dueDate,
      'due_time': dueTime,
      'created_time': createdTime,
      'updated_time': updatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseWorkRecordDocumentEquality implements Equality<CourseWorkRecord> {
  const CourseWorkRecordDocumentEquality();

  @override
  bool equals(CourseWorkRecord? e1, CourseWorkRecord? e2) {
    return e1?.studentId == e2?.studentId &&
        e1?.courseId == e2?.courseId &&
        e1?.coursework == e2?.coursework &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.state == e2?.state &&
        e1?.dueDate == e2?.dueDate &&
        e1?.dueTime == e2?.dueTime &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime;
  }

  @override
  int hash(CourseWorkRecord? e) => const ListEquality().hash([
        e?.studentId,
        e?.courseId,
        e?.coursework,
        e?.title,
        e?.description,
        e?.state,
        e?.dueDate,
        e?.dueTime,
        e?.createdTime,
        e?.updatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseWorkRecord;
}
