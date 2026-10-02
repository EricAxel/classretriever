// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseWorklistStruct extends FFFirebaseStruct {
  CourseWorklistStruct({
    List<CourseWorkStruct>? courseWork,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseWork = courseWork,
        super(firestoreUtilData);

  // "courseWork" field.
  List<CourseWorkStruct>? _courseWork;
  List<CourseWorkStruct> get courseWork => _courseWork ?? const [];
  set courseWork(List<CourseWorkStruct>? val) => _courseWork = val;

  void updateCourseWork(Function(List<CourseWorkStruct>) updateFn) {
    updateFn(_courseWork ??= []);
  }

  bool hasCourseWork() => _courseWork != null;

  static CourseWorklistStruct fromMap(Map<String, dynamic> data) =>
      CourseWorklistStruct(
        courseWork: getStructList(
          data['courseWork'],
          CourseWorkStruct.fromMap,
        ),
      );

  static CourseWorklistStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseWorklistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseWork': _courseWork?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseWork': serializeParam(
          _courseWork,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CourseWorklistStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseWorklistStruct(
        courseWork: deserializeStructParam<CourseWorkStruct>(
          data['courseWork'],
          ParamType.DataStruct,
          true,
          structBuilder: CourseWorkStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CourseWorklistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CourseWorklistStruct &&
        listEquality.equals(courseWork, other.courseWork);
  }

  @override
  int get hashCode => const ListEquality().hash([courseWork]);
}

CourseWorklistStruct createCourseWorklistStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseWorklistStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseWorklistStruct? updateCourseWorklistStruct(
  CourseWorklistStruct? courseWorklist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseWorklist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseWorklistStructData(
  Map<String, dynamic> firestoreData,
  CourseWorklistStruct? courseWorklist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseWorklist == null) {
    return;
  }
  if (courseWorklist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseWorklist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseWorklistData =
      getCourseWorklistFirestoreData(courseWorklist, forFieldValue);
  final nestedData =
      courseWorklistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseWorklist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseWorklistFirestoreData(
  CourseWorklistStruct? courseWorklist, [
  bool forFieldValue = false,
]) {
  if (courseWorklist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseWorklist.toMap());

  // Add any Firestore field values
  mapToFirestore(courseWorklist.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseWorklistListFirestoreData(
  List<CourseWorklistStruct>? courseWorklists,
) =>
    courseWorklists
        ?.map((e) => getCourseWorklistFirestoreData(e, true))
        .toList() ??
    [];
