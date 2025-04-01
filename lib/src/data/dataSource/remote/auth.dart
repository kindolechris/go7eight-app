import 'dart:convert';

import 'package:go7eight/src/data/config/http_client.dart';
import 'package:go7eight/src/data/dataSource/remote/response_object.dart';

import '../../../models/user.dart';


class AuthApiService {

  final httpClient = HttpClientWrapper();

  Future<ResponseObject> loginUser(payload) async {
    final response = await httpClient.post(
        'oauth/token',
        data: payload,
        formUrlEncoded: true,
        useBasicAuthToken: true
    );
    print(response.body);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      return ResponseObject(code: 7000, data: jsonResponse, message: "logged in successfully");
    }else if(response.statusCode == 401){
      final jsonResponse = jsonDecode(response.body);
      return ResponseObject(code: 401, message: jsonResponse['error_description']);
    }else{
      return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
    }
  }

  Future<ResponseObject> checkUser(email,identifier,authenticationMethod) async {
    try {
      final response = await httpClient.get(
          'api/users',
          useToken: false,
          queryParameters: {
            "username" : email,
            "identifier" : identifier,
            "authenticationMethod" : authenticationMethod,
          }
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code : jsonResponse['code'], data: jsonResponse['data'], message: jsonResponse['message']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }

  Future<ResponseObject> verifyPhone(phone,otp) async {
    try {
      final response = await httpClient.post(
          'api/users/mobile-verification/complete',
          useToken: false,
          formUrlEncoded: false,
          data: {
            "phoneNumber" : phone,
            "otp" : otp,
          }
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code:jsonResponse['code'], data: jsonResponse['data'], message: jsonResponse['message']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    }catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }

  Future<ResponseObject> verifyEmail(email,otp) async {
    try {
      final response = await httpClient.post(
          'api/users/email-verification/complete',
          useToken: false,
          formUrlEncoded: false,
          data: {
            "email" : email,
            "otp" : otp,
          }
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code:jsonResponse['code'], data: jsonResponse['data'], message: jsonResponse['message']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }

  Future<ResponseObject> register(Customer customer) async {
    try {

      final response = await httpClient.post(
          'api/users',
          useToken: false,
          formUrlEncoded: false,
          data: {
            "firstName": customer.firstName,
            "lastName": customer.lastName,
            "country": customer.country,
            //"phoneNumber": customer.phone,
            "dob": customer.dateOfBirth,
            "username": customer.username,
            "nickname": customer.nickName,
            "password": customer.password,
            "email": customer.email,
            "registrationRef": customer.registrationRef,
          }
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code: jsonResponse['code'], data: jsonResponse['data'], message: jsonResponse['message']);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }

  Future<ResponseObject> getCustomerLogged() async {
    try {
      final response = await httpClient.get(
          'users/logged',
          useToken: true,
      );
      if(response.statusCode == 200){
        final jsonResponse = jsonDecode(response.body);
        return ResponseObject(code: jsonResponse['code'], data: jsonResponse['data'], message: jsonResponse['message']);
      }else if(response.statusCode == 401){
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }else{
        return ResponseObject(code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      return ResponseObject(code: 500, message: e.toString());
    }
  }
}
