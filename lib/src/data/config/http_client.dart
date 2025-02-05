import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HttpClientWrapper {
  final String baseUrl = 'http://209.74.77.69:8082/';
  //final String baseUrl = 'http://192.168.0.209:8082/';
  final GetStorage storage = GetStorage();
  Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  HttpClientWrapper();

  /// GET request
  Future<http.Response> get(
      String path, {
        Map<String, String>? queryParameters,
        bool useToken = false,
        bool useBasicAuthToken = false,
      }) async {
    final uri = Uri.parse(baseUrl + path).replace(queryParameters: queryParameters);
    final headers = _configureHeaders(useToken, useBasicAuthToken);

    try {
      final response = await http.get(uri, headers: headers);
      _logRequest('GET', uri, headers, null);
      _logResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// POST request
  Future<http.Response> post(
      String path, {
        dynamic data,
        Map<String, String>? queryParameters,
        bool useToken = false,
        bool useBasicAuthToken = false,
        bool formUrlEncoded = false,
      }) async {
    final uri = Uri.parse(baseUrl + path).replace(queryParameters: queryParameters);
    final headers = _configureHeaders(useToken, useBasicAuthToken);

    dynamic body = data;
    if (formUrlEncoded && data is Map) {
      headers['Content-Type'] = 'application/x-www-form-urlencoded';
      body = Uri(queryParameters: data as Map<String, dynamic>).query;
    } else {
      body = jsonEncode(data);
    }

    try {
      final response = await http.post(uri, headers: headers, body: body);
      _logRequest('POST', uri, headers, body);
      _logResponse(response);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Configure headers dynamically
  Map<String, String> _configureHeaders(bool useToken, bool useBasicAuthToken) {
    final headers = Map<String, String>.from(defaultHeaders);

    if (useToken) {
      final token = storage.read<String>('accessToken');
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    if (useBasicAuthToken) {
      headers['Authorization'] = 'Basic Z283ZWlnaHQtbW9iaWxlLWFwcDoxMjM0NTY3OA==';
    }

    return headers;
  }

  /// Handle errors
  void _handleError(Object error) {
    if (error is http.ClientException) {
      debugPrint('HTTP Client Exception: ${error.message}');
    } else {
      debugPrint('Unexpected error: $error');
    }
  }

  /// Log request details
  void _logRequest(String method, Uri uri, Map<String, String> headers, dynamic body) {
    debugPrint('--- HTTP $method Request ---');
    debugPrint('URL: $uri');
    debugPrint('Headers: $headers');
    if (body != null) debugPrint('Body: $body');
  }

  /// Log response details
  void _logResponse(http.Response response) {
    debugPrint('--- HTTP Response ---');
    debugPrint('Status Code: ${response.statusCode}');
    debugPrint('Headers: ${response.headers}');
    debugPrint('Body: ${response.body}');
  }
}
