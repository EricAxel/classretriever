// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseWorkStruct extends FFFirebaseStruct {
  CourseWorkStruct({
    String? courseId,
    String? id,
    String? title,
    String? description,
    List<MaterialsStruct>? materials,
    String? state,
    String? alternateLink,
    String? creationTime,
    String? updateTime,
    DueDateStruct? dueDate,
    DueTimeStruct? dueTime,
    int? maxPoints,
    String? workType,
    String? submissionModificationMode,
    String? creatorUserId,
    String? coursename,
    List<StudentSubmissionsStruct>? studentSubmissions,
    String? studentSubmissionId,
    String? actualStatus,
    DateTime? datetime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseId = courseId,
        _id = id,
        _title = title,
        _description = description,
        _materials = materials,
        _state = state,
        _alternateLink = alternateLink,
        _creationTime = creationTime,
        _updateTime = updateTime,
        _dueDate = dueDate,
        _dueTime = dueTime,
        _maxPoints = maxPoints,
        _workType = workType,
        _submissionModificationMode = submissionModificationMode,
        _creatorUserId = creatorUserId,
        _coursename = coursename,
        _studentSubmissions = studentSubmissions,
        _studentSubmissionId = studentSubmissionId,
        _actualStatus = actualStatus,
        _datetime = datetime,
        super(firestoreUtilData);

  // "courseId" field.
  String? _courseId;
  String get courseId => _courseId ?? '';
  set courseId(String? val) => _courseId = val;

  bool hasCourseId() => _courseId != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "materials" field.
  List<MaterialsStruct>? _materials;
  List<MaterialsStruct> get materials => _materials ?? const [];
  set materials(List<MaterialsStruct>? val) => _materials = val;

  void updateMaterials(Function(List<MaterialsStruct>) updateFn) {
    updateFn(_materials ??= []);
  }

  bool hasMaterials() => _materials != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "alternateLink" field.
  String? _alternateLink;
  String get alternateLink => _alternateLink ?? '';
  set alternateLink(String? val) => _alternateLink = val;

  bool hasAlternateLink() => _alternateLink != null;

  // "creationTime" field.
  String? _creationTime;
  String get creationTime => _creationTime ?? '';
  set creationTime(String? val) => _creationTime = val;

  bool hasCreationTime() => _creationTime != null;

  // "updateTime" field.
  String? _updateTime;
  String get updateTime => _updateTime ?? '';
  set updateTime(String? val) => _updateTime = val;

  bool hasUpdateTime() => _updateTime != null;

  // "dueDate" field.
  DueDateStruct? _dueDate;
  DueDateStruct get dueDate => _dueDate ?? DueDateStruct();
  set dueDate(DueDateStruct? val) => _dueDate = val;

  void updateDueDate(Function(DueDateStruct) updateFn) {
    updateFn(_dueDate ??= DueDateStruct());
  }

  bool hasDueDate() => _dueDate != null;

  // "dueTime" field.
  DueTimeStruct? _dueTime;
  DueTimeStruct get dueTime => _dueTime ?? DueTimeStruct();
  set dueTime(DueTimeStruct? val) => _dueTime = val;

  void updateDueTime(Function(DueTimeStruct) updateFn) {
    updateFn(_dueTime ??= DueTimeStruct());
  }

  bool hasDueTime() => _dueTime != null;

  // "maxPoints" field.
  int? _maxPoints;
  int get maxPoints => _maxPoints ?? 0;
  set maxPoints(int? val) => _maxPoints = val;

  void incrementMaxPoints(int amount) => maxPoints = maxPoints + amount;

  bool hasMaxPoints() => _maxPoints != null;

  // "workType" field.
  String? _workType;
  String get workType => _workType ?? '';
  set workType(String? val) => _workType = val;

  bool hasWorkType() => _workType != null;

  // "submissionModificationMode" field.
  String? _submissionModificationMode;
  String get submissionModificationMode => _submissionModificationMode ?? '';
  set submissionModificationMode(String? val) =>
      _submissionModificationMode = val;

  bool hasSubmissionModificationMode() => _submissionModificationMode != null;

  // "creatorUserId" field.
  String? _creatorUserId;
  String get creatorUserId => _creatorUserId ?? '';
  set creatorUserId(String? val) => _creatorUserId = val;

  bool hasCreatorUserId() => _creatorUserId != null;

  // "coursename" field.
  String? _coursename;
  String get coursename => _coursename ?? '';
  set coursename(String? val) => _coursename = val;

  bool hasCoursename() => _coursename != null;

  // "studentSubmissions" field.
  List<StudentSubmissionsStruct>? _studentSubmissions;
  List<StudentSubmissionsStruct> get studentSubmissions =>
      _studentSubmissions ?? const [];
  set studentSubmissions(List<StudentSubmissionsStruct>? val) =>
      _studentSubmissions = val;

  void updateStudentSubmissions(
      Function(List<StudentSubmissionsStruct>) updateFn) {
    updateFn(_studentSubmissions ??= []);
  }

  bool hasStudentSubmissions() => _studentSubmissions != null;

  // "studentSubmissionId" field.
  String? _studentSubmissionId;
  String get studentSubmissionId => _studentSubmissionId ?? '';
  set studentSubmissionId(String? val) => _studentSubmissionId = val;

  bool hasStudentSubmissionId() => _studentSubmissionId != null;

  // "actualStatus" field.
  String? _actualStatus;
  String get actualStatus => _actualStatus ?? '';
  set actualStatus(String? val) => _actualStatus = val;

  bool hasActualStatus() => _actualStatus != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  static CourseWorkStruct fromMap(Map<String, dynamic> data) =>
      CourseWorkStruct(
        courseId: data['courseId'] as String?,
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        materials: getStructList(
          data['materials'],
          MaterialsStruct.fromMap,
        ),
        state: data['state'] as String?,
        alternateLink: data['alternateLink'] as String?,
        creationTime: data['creationTime'] as String?,
        updateTime: data['updateTime'] as String?,
        dueDate: data['dueDate'] is DueDateStruct
            ? data['dueDate']
            : DueDateStruct.maybeFromMap(data['dueDate']),
        dueTime: data['dueTime'] is DueTimeStruct
            ? data['dueTime']
            : DueTimeStruct.maybeFromMap(data['dueTime']),
        maxPoints: castToType<int>(data['maxPoints']),
        workType: data['workType'] as String?,
        submissionModificationMode:
            data['submissionModificationMode'] as String?,
        creatorUserId: data['creatorUserId'] as String?,
        coursename: data['coursename'] as String?,
        studentSubmissions: getStructList(
          data['studentSubmissions'],
          StudentSubmissionsStruct.fromMap,
        ),
        studentSubmissionId: data['studentSubmissionId'] as String?,
        actualStatus: data['actualStatus'] as String?,
        datetime: data['datetime'] as DateTime?,
      );

  static CourseWorkStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseWorkStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseId': _courseId,
        'id': _id,
        'title': _title,
        'description': _description,
        'materials': _materials?.map((e) => e.toMap()).toList(),
        'state': _state,
        'alternateLink': _alternateLink,
        'creationTime': _creationTime,
        'updateTime': _updateTime,
        'dueDate': _dueDate?.toMap(),
        'dueTime': _dueTime?.toMap(),
        'maxPoints': _maxPoints,
        'workType': _workType,
        'submissionModificationMode': _submissionModificationMode,
        'creatorUserId': _creatorUserId,
        'coursename': _coursename,
        'studentSubmissions':
            _studentSubmissions?.map((e) => e.toMap()).toList(),
        'studentSubmissionId': _studentSubmissionId,
        'actualStatus': _actualStatus,
        'datetime': _datetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseId': serializeParam(
          _courseId,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'materials': serializeParam(
          _materials,
          ParamType.DataStruct,
          isList: true,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'alternateLink': serializeParam(
          _alternateLink,
          ParamType.String,
        ),
        'creationTime': serializeParam(
          _creationTime,
          ParamType.String,
        ),
        'updateTime': serializeParam(
          _updateTime,
          ParamType.String,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.DataStruct,
        ),
        'dueTime': serializeParam(
          _dueTime,
          ParamType.DataStruct,
        ),
        'maxPoints': serializeParam(
          _maxPoints,
          ParamType.int,
        ),
        'workType': serializeParam(
          _workType,
          ParamType.String,
        ),
        'submissionModificationMode': serializeParam(
          _submissionModificationMode,
          ParamType.String,
        ),
        'creatorUserId': serializeParam(
          _creatorUserId,
          ParamType.String,
        ),
        'coursename': serializeParam(
          _coursename,
          ParamType.String,
        ),
        'studentSubmissions': serializeParam(
          _studentSubmissions,
          ParamType.DataStruct,
          isList: true,
        ),
        'studentSubmissionId': serializeParam(
          _studentSubmissionId,
          ParamType.String,
        ),
        'actualStatus': serializeParam(
          _actualStatus,
          ParamType.String,
        ),
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CourseWorkStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseWorkStruct(
        courseId: deserializeParam(
          data['courseId'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        materials: deserializeStructParam<MaterialsStruct>(
          data['materials'],
          ParamType.DataStruct,
          true,
          structBuilder: MaterialsStruct.fromSerializableMap,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        alternateLink: deserializeParam(
          data['alternateLink'],
          ParamType.String,
          false,
        ),
        creationTime: deserializeParam(
          data['creationTime'],
          ParamType.String,
          false,
        ),
        updateTime: deserializeParam(
          data['updateTime'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeStructParam(
          data['dueDate'],
          ParamType.DataStruct,
          false,
          structBuilder: DueDateStruct.fromSerializableMap,
        ),
        dueTime: deserializeStructParam(
          data['dueTime'],
          ParamType.DataStruct,
          false,
          structBuilder: DueTimeStruct.fromSerializableMap,
        ),
        maxPoints: deserializeParam(
          data['maxPoints'],
          ParamType.int,
          false,
        ),
        workType: deserializeParam(
          data['workType'],
          ParamType.String,
          false,
        ),
        submissionModificationMode: deserializeParam(
          data['submissionModificationMode'],
          ParamType.String,
          false,
        ),
        creatorUserId: deserializeParam(
          data['creatorUserId'],
          ParamType.String,
          false,
        ),
        coursename: deserializeParam(
          data['coursename'],
          ParamType.String,
          false,
        ),
        studentSubmissions: deserializeStructParam<StudentSubmissionsStruct>(
          data['studentSubmissions'],
          ParamType.DataStruct,
          true,
          structBuilder: StudentSubmissionsStruct.fromSerializableMap,
        ),
        studentSubmissionId: deserializeParam(
          data['studentSubmissionId'],
          ParamType.String,
          false,
        ),
        actualStatus: deserializeParam(
          data['actualStatus'],
          ParamType.String,
          false,
        ),
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CourseWorkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CourseWorkStruct &&
        courseId == other.courseId &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        listEquality.equals(materials, other.materials) &&
        state == other.state &&
        alternateLink == other.alternateLink &&
        creationTime == other.creationTime &&
        updateTime == other.updateTime &&
        dueDate == other.dueDate &&
        dueTime == other.dueTime &&
        maxPoints == other.maxPoints &&
        workType == other.workType &&
        submissionModificationMode == other.submissionModificationMode &&
        creatorUserId == other.creatorUserId &&
        coursename == other.coursename &&
        listEquality.equals(studentSubmissions, other.studentSubmissions) &&
        studentSubmissionId == other.studentSubmissionId &&
        actualStatus == other.actualStatus &&
        datetime == other.datetime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        courseId,
        id,
        title,
        description,
        materials,
        state,
        alternateLink,
        creationTime,
        updateTime,
        dueDate,
        dueTime,
        maxPoints,
        workType,
        submissionModificationMode,
        creatorUserId,
        coursename,
        studentSubmissions,
        studentSubmissionId,
        actualStatus,
        datetime
      ]);
}

CourseWorkStruct createCourseWorkStruct({
  String? courseId,
  String? id,
  String? title,
  String? description,
  String? state,
  String? alternateLink,
  String? creationTime,
  String? updateTime,
  DueDateStruct? dueDate,
  DueTimeStruct? dueTime,
  int? maxPoints,
  String? workType,
  String? submissionModificationMode,
  String? creatorUserId,
  String? coursename,
  String? studentSubmissionId,
  String? actualStatus,
  DateTime? datetime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseWorkStruct(
      courseId: courseId,
      id: id,
      title: title,
      description: description,
      state: state,
      alternateLink: alternateLink,
      creationTime: creationTime,
      updateTime: updateTime,
      dueDate: dueDate ?? (clearUnsetFields ? DueDateStruct() : null),
      dueTime: dueTime ?? (clearUnsetFields ? DueTimeStruct() : null),
      maxPoints: maxPoints,
      workType: workType,
      submissionModificationMode: submissionModificationMode,
      creatorUserId: creatorUserId,
      coursename: coursename,
      studentSubmissionId: studentSubmissionId,
      actualStatus: actualStatus,
      datetime: datetime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseWorkStruct? updateCourseWorkStruct(
  CourseWorkStruct? courseWork, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseWork
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseWorkStructData(
  Map<String, dynamic> firestoreData,
  CourseWorkStruct? courseWork,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseWork == null) {
    return;
  }
  if (courseWork.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseWork.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseWorkData = getCourseWorkFirestoreData(courseWork, forFieldValue);
  final nestedData = courseWorkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseWork.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseWorkFirestoreData(
  CourseWorkStruct? courseWork, [
  bool forFieldValue = false,
]) {
  if (courseWork == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseWork.toMap());

  // Handle nested data for "dueDate" field.
  addDueDateStructData(
    firestoreData,
    courseWork.hasDueDate() ? courseWork.dueDate : null,
    'dueDate',
    forFieldValue,
  );

  // Handle nested data for "dueTime" field.
  addDueTimeStructData(
    firestoreData,
    courseWork.hasDueTime() ? courseWork.dueTime : null,
    'dueTime',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(courseWork.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseWorkListFirestoreData(
  List<CourseWorkStruct>? courseWorks,
) =>
    courseWorks?.map((e) => getCourseWorkFirestoreData(e, true)).toList() ?? [];
