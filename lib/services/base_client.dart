import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class BaseClient {
  static const int timeOutDuration = 20;
  // static const String _token = "access_token_key";

  final String? url;
  final dynamic body;
  final String? authToken;

  var client = http.Client();

  BaseClient({
    this.url,
    this.body,
    this.authToken,
  });

/*
  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
  */

  Map<String, String>? _getDefaultHeaders() {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Content-Language': 'mobile',
    };
    return headers;
  }

  Future<Map<String, String>?> _getAuthHeaders(
      {bool? withoutAccessToken}) async {
    var headers = _getDefaultHeaders();

    if (withoutAccessToken == true) {
      return headers;
    }

    // String? accessToken = await getAccessToken();
    // headers!.putIfAbsent("Authorization", () => "bearer ${accessToken!}");
    return headers;
  }

  //Get request to server
  Future<dynamic> get() async {
    try {
      final resp = (await client
          .get(Uri.parse(url!))
          .timeout(const Duration(seconds: timeOutDuration)));
      return _processResponse(resp);
    } on SocketException {
      throw SocketExceptionHandler(
          'Socket connection error.\nPlease check your internet connection and try again.',
          url);
    } on TimeoutException {
      throw RequestTimeoutException(
          'Request timeout.\nPlease check your internet connection and try again.',
          url);
    } on FormatException {
      throw FetchDataException(
          "Something went wrong.\nServers are busy at this moment please try again.",
          url);
    } on HandshakeException {
      throw NoInternetConnectionException(
          "No internet connection.\nPlease check your internet connection and try again.",
          url);
    }
  }

  //Post request to server
  Future<dynamic> post() async {
    try {
      final authHeaders = await _getAuthHeaders();
      log("Url $url", name: "URL", error: authHeaders.toString());
      var response = await client
          .post(
            Uri.parse(url!),
            headers: authHeaders,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw SocketExceptionHandler(
          'Socket connection error.\nPlease check your internet connection and try again.',
          url);
    } on TimeoutException {
      throw RequestTimeoutException(
          'Request timeout.\nPlease check your internet connection and try again.',
          url);
    } on FormatException {
      throw FetchDataException("INVALID CREDENTIALS", url);
    } on HandshakeException {
      throw NoInternetConnectionException(
          "No internet connection.\nPlease check your internet connection and try again.",
          url);
    }
  }

  ///DECODE JSON IF SUCCESS ELSE THROWS AN EXCEPTION
  dynamic _processResponse(http.Response response) {
    log("Url ${response.request!.url}", name: "URL");
    log("Response ${response.body}", name: "RESPONSE");

    switch (response.statusCode) {
      case 200:
        if (response.body.isEmpty) {
          return;
        }
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 201:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 400:
        throw FetchDataException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 401:
        throw UnAuthorizedException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 403:
        throw ForbiddenException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 405:
        throw ForbiddenException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 409:
        throw BadRequestException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 422:
        throw BadRequestException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      case 500:
        throw BadRequestException(
          json.decode(response.body)['error']['message'],
          response.request!.url.toString(),
        );

      default:
        throw FetchDataException(
          json.decode(response.body).toString(),
          response.request!.url.toString(),
        );
    }
  }
}
