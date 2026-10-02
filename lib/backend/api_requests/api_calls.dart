import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

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
  static CourseWorkSingleCall courseWorkSingleCall = CourseWorkSingleCall();
  static CourseWorkListCall courseWorkListCall = CourseWorkListCall();
  static StatusAssigmentCall statusAssigmentCall = StatusAssigmentCall();
  static SubmissionStatusCall submissionStatusCall = SubmissionStatusCall();
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

class CourseWorkSingleCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? id = '',
    String? token = '',
  }) async {
    final baseUrl = GoogleClassroomGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CourseWork single',
      apiUrl: '${baseUrl}/courses/${courseId}/courseWork/${id}',
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

class CourseWorkListCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = GoogleClassroomGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CourseWork list',
      apiUrl: '${baseUrl}/courses/${courseId}/courseWork',
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

class StatusAssigmentCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? courseWorkId = '',
    String? id = '',
    String? token = '',
  }) async {
    final baseUrl = GoogleClassroomGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Status Assigment',
      apiUrl:
          '${baseUrl}/courses/${courseId}/courseWork/${courseWorkId}/studentSubmissions/${id}',
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

  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
}

class SubmissionStatusCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? courseWorkId = '',
    String? token = '',
  }) async {
    final baseUrl = GoogleClassroomGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SubmissionStatus',
      apiUrl:
          '${baseUrl}/courses/${courseId}/courseWork/${courseWorkId}/studentSubmissions',
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

  String? studentId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.studentSubmissions[:].id''',
      ));
}

/// End Google Classroom Group Code

/// Start Google Oauth Group Code

class GoogleOauthGroup {
  static String getBaseUrl() => 'https://accounts.google.com/o/oauth2';
  static Map<String, String> headers = {};
  static GoogleOauthICall googleOauthICall = GoogleOauthICall();
  static GoogleOauthIICall googleOauthIICall = GoogleOauthIICall();
}

class GoogleOauthICall {
  Future<ApiCallResponse> call({
    String? scope = '',
    String? classroomkey = '',
    String? clientId = '',
    String? redirectUrl = '',
  }) async {
    final baseUrl = GoogleOauthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Google Oauth I',
      apiUrl:
          '${baseUrl}/auth?client_id=${clientId}& redirect_uri=${redirectUrl}&scope=${scope}&response_type=code',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'bearer ${classroomkey}',
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

class GoogleOauthIICall {
  Future<ApiCallResponse> call({
    String? responseType = '',
    String? clientId = '[GoogleOauthClientID]',
    String? redirectUri = '',
    String? scope = '',
    String? state = '',
  }) async {
    final baseUrl = GoogleOauthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Google Oauth II',
      apiUrl:
          '${baseUrl}/v2/auth?scope=${scope}&access_type=offline&include_granted_scopes=true&response_type=code&redirect_uri=${redirectUri}&client_id=${clientId}',
      callType: ApiCallType.GET,
      headers: {},
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

/// End Google Oauth Group Code

/// Start Google OAuth Token Exchange Group Code

class GoogleOAuthTokenExchangeGroup {
  static String getBaseUrl() => 'https://oauth2.googleapis.com';
  static Map<String, String> headers = {};
  static ExchangeAuthorizationCodeForRefreshAndAccessTokensCall
      exchangeAuthorizationCodeForRefreshAndAccessTokensCall =
      ExchangeAuthorizationCodeForRefreshAndAccessTokensCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
}

class ExchangeAuthorizationCodeForRefreshAndAccessTokensCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? clientId = '[GoogleOauthClientID]',
    String? clientSecret = const String.fromEnvironment('GOOGLE_OAUTH_EXCHANGE_CLIENT_SECRET'),
    String? redirectUri = 'https://web.edfluence.app/connect/youtube',
    String? grantType = 'authorization_code',
  }) async {
    final baseUrl = GoogleOAuthTokenExchangeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Exchange authorization code for refresh and access tokens',
      apiUrl:
          '${baseUrl}/token?code=${code}&client_id=${clientId}&client_secret=${clientSecret}&redirect_uri=${redirectUri}&grant_type=authorization_code',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
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

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? clientId =
        const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_ID'),
    String? clientSecret = const String.fromEnvironment('GOOGLE_OAUTH_CLIENT_SECRET'),
    String? refreshToken = '',
    String? grantType = 'refresh_token',
  }) async {
    final baseUrl = GoogleOAuthTokenExchangeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Refresh token',
      apiUrl: '${baseUrl}/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
        'grant_type': grantType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accsestoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

/// End Google OAuth Token Exchange Group Code

/// Start Transactional emails Group Code

class TransactionalEmailsGroup {
  static String getBaseUrl() => 'https://o775fm.buildship.run';
  static Map<String, String> headers = {};
  static RequestConnectionCall requestConnectionCall = RequestConnectionCall();
  static RequestITSupportCall requestITSupportCall = RequestITSupportCall();
}

class RequestConnectionCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? tutoremail = '',
    String? url = '',
    String? reciver = '',
  }) async {
    final baseUrl = TransactionalEmailsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request connection',
      apiUrl:
          '${baseUrl}/requestConnection?name=${name}&tutoremail=${tutoremail}&url=${url}&reciver=${reciver}',
      callType: ApiCallType.GET,
      headers: {},
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

class RequestITSupportCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? email = '',
  }) async {
    final baseUrl = TransactionalEmailsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Request IT Support',
      apiUrl:
          '${baseUrl}/request-it-support-8c72f5b5656d?firstName=${firstName}&email=${email}',
      callType: ApiCallType.GET,
      headers: {},
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

/// End Transactional emails Group Code

class GoogleClassroomCoursesAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Classroom Courses API',
      apiUrl: 'https://classroom.googleapis.com/v1/courses',
      callType: ApiCallType.GET,
      headers: {},
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

class GoogleClassroomCourseWorkAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Classroom CourseWork API',
      apiUrl:
          'https://classroom.googleapis.com/v1/courses/{courseId}/courseWork',
      callType: ApiCallType.GET,
      headers: {},
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

class LoopsEmailIntegrationHelpCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transactionalId": "cm7to91is02kt12wcvet5u20t",
  "email": ${email == null ? 'null' : '"${escapeStringForJson(email)}"'},
  "dataVariables": {
    "first_name": ${firstName == null ? 'null' : '"${escapeStringForJson(firstName)}"'}
  }
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Loops Email Integration Help',
      apiUrl: 'https://app.loops.so/api/v1/transactional',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer aceea66ae2aa1dc950a145c58b1ad760',
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
