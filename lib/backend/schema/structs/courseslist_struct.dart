// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseslistStruct extends FFFirebaseStruct {
  CourseslistStruct({
    List<CoursesStruct>? courses,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courses = courses,
        super(firestoreUtilData);

  // "courses" field.
  List<CoursesStruct>? _courses;
  List<CoursesStruct> get courses => _courses ?? const [];
  set courses(List<CoursesStruct>? val) => _courses = val;

  void updateCourses(Function(List<CoursesStruct>) updateFn) {
    updateFn(_courses ??= []);
  }

  bool hasCourses() => _courses != null;

  static CourseslistStruct fromMap(Map<String, dynamic> data) =>
      CourseslistStruct(
        courses: getStructList(
          data['courses'],
          CoursesStruct.fromMap,
        ),
      );

  static CourseslistStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseslistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courses': _courses?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courses': serializeParam(
          _courses,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CourseslistStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseslistStruct(
        courses: deserializeStructParam<CoursesStruct>(
          data['courses'],
          ParamType.DataStruct,
          true,
          structBuilder: CoursesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CourseslistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CourseslistStruct &&
        listEquality.equals(courses, other.courses);
  }

  @override
  int get hashCode => const ListEquality().hash([courses]);
}

CourseslistStruct createCourseslistStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseslistStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseslistStruct? updateCourseslistStruct(
  CourseslistStruct? courseslist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseslist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseslistStructData(
  Map<String, dynamic> firestoreData,
  CourseslistStruct? courseslist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseslist == null) {
    return;
  }
  if (courseslist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseslist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseslistData =
      getCourseslistFirestoreData(courseslist, forFieldValue);
  final nestedData =
      courseslistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseslist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseslistFirestoreData(
  CourseslistStruct? courseslist, [
  bool forFieldValue = false,
]) {
  if (courseslist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseslist.toMap());

  // Add any Firestore field values
  mapToFirestore(courseslist.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseslistListFirestoreData(
  List<CourseslistStruct>? courseslists,
) =>
    courseslists?.map((e) => getCourseslistFirestoreData(e, true)).toList() ??
    [];
