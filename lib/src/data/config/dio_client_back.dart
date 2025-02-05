// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
//
// class DioClient {
//   late final Dio _dio;
//
//   DioClient({bool includeCustomHeaders = false}) {
//     final Map<String, String> defaultHeaders = {
//       'Content-Type': 'application/json',
//     };
//
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: 'http://209.74.77.69:8082/',
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         headers: defaultHeaders,
//       ),
//     );
//
//     // Add interceptors
//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         print('Making request to: ${options.uri}');
//         print('Headers: ${jsonEncode(options.headers)}');
//         // print('Body: ${jsonEncode(options.data)}');
//         return handler.next(options); // Continue with the request
//       },
//       onError: (DioException error, handler) {
//         return handler.next(error); // Continue with the error
//       },
//     ));
//   }
//
//   Dio get instance => _dio;
//
//   Future<Response> get(
//       String path, {
//         Map<String, dynamic>? queryParameters,
//         bool useToken = false,
//         bool useBaicAuthToken = false,
//       }) async {
//     _configureHeaders(useToken,useBaicAuthToken);
//     try {
//       return await _dio.get(path, queryParameters: queryParameters);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Response> post(
//       String path, {
//         dynamic data,
//         Map<String, dynamic>? queryParameters,
//         bool useToken = false,
//         bool useBasicAuthToken = false,
//         bool formUrlEncoded = false,
//       }) async {
//     _configureHeaders(useToken,useBasicAuthToken);
//
//     if (formUrlEncoded) {
//       _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
//       if (data is Map) {
//         data = FormData.fromMap((data as Map).cast<String, dynamic>());
//       }
//     } else {
//       _dio.options.headers['Content-Type'] = 'application/json';
//     }
//
//     try {
//       return await _dio.post(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   void _configureHeaders(bool useToken,bool useBasicAuthToken) {
//     if (useToken) {
//       final token = GetStorage().read<String>('accessToken');
//       if (token != null && token.isNotEmpty) {
//         _dio.options.headers['Authorization'] = 'Bearer $token';
//       } else {
//         _dio.options.headers.remove('Authorization');
//       }
//     } else {
//       _dio.options.headers.remove('Authorization');
//     }
//
//     if(useBasicAuthToken){
//       _dio.options.headers['Authorization'] = 'Basic Z283ZWlnaHQtbW9iaWxlLWFwcDoxMjM0NTY3OA==';
//     }
//   }
// }
