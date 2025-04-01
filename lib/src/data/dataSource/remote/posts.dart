import 'dart:convert';

import 'package:go7eight/src/core/constants/app_api_repsonse_code.dart';
import 'package:go7eight/src/data/config/http_client.dart';
import 'package:go7eight/src/data/dataSource/remote/response_object.dart';

class PostsApiService {

  final httpClient = HttpClientWrapper();

  Future<ResponseObject> geAllPosts(payload) async {
    try {
      final response = await httpClient.get(
          'api/posts',
          queryParameters: payload,
          useToken: true,
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code:jsonResponse['code'],data: jsonResponse['data'], message: jsonResponse['message']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
      }catch (e) {
      return ResponseObject(code: AppResponseCode.EXCEPTION, message: e.toString());
     }
  }

  Future<ResponseObject> createAPost(payload) async {
    try {
      final response = await httpClient.post(
        'posts',
        useToken: true,
        data: payload
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code:jsonResponse['code']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    }catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }
}