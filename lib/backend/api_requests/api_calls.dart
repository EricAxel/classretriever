import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Google Classroom Group Code

class GoogleClassroomGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://classroom.googleapis.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static CoursesCall coursesCall = CoursesCall();
}

class CoursesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = GoogleClassroomGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Courses',
      apiUrl: '${baseUrl}/courses',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Google Classroom Group Code

/// Sincronización de las tareas de un estudiante con la función `sync` de
/// Firebase. El servidor habla con Google; el teléfono no recibe tokens.
class ClassroomSyncCall {
  static Future<ApiCallResponse> call({
    required String studentId,
    required Map<String, String> known,
    required String idToken,
  }) async {
    final ffApiRequestBody = json.encode({
      'studentId': studentId,
      'known': known,
    });
    return ApiManager.instance.makeApiCall(
      callName: 'Classroom sync',
      apiUrl: 'https://us-central1-class-retriever-42b99.cloudfunctions.net/sync',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// Quita a un estudiante de la cuenta del padre con la función `removeStudent`
/// de Firebase (si era el último padre, también revoca el permiso en Google).
class RemoveStudentCall {
  static Future<ApiCallResponse> call({
    required String studentId,
    required String idToken,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Remove student',
      apiUrl:
          'https://us-central1-class-retriever-42b99.cloudfunctions.net/removeStudent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: json.encode({'studentId': studentId}),
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// Correo de ayuda del onboarding. Lo envía la función `onboardingEmail` de
/// Firebase por Loops; la clave de Loops ya no está en la app.
class LoopsEmailIntegrationHelpCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
  }) async {
    String idToken = '';
    try {
      idToken = await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
    } catch (_) {}
    final ffApiRequestBody = json.encode({
      'email': email ?? '',
      'firstName': firstName ?? '',
    });
    return ApiManager.instance.makeApiCall(
      callName: 'Loops Email Integration Help',
      apiUrl:
          'https://us-central1-class-retriever-42b99.cloudfunctions.net/onboardingEmail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${idToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
