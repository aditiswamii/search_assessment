import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

import 'app_apis.dart';

class ApiProvider {

  Future<dynamic> get(String endPoint,Map<String, dynamic>? queryParameters,) async {
    var dio = Dio(); // with default Options
    dio.options.baseUrl = Apis.baseUrl;
    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 3000;
    late Response response;
    try {
      response = await dio.get(endPoint,queryParameters: queryParameters);
    }  on DioError catch (e) {
     debugPrint(e.toString());
    }
    return response;
  }
  Future<dynamic> post({
  Map<String, dynamic>? queryParameters,
    required Uri endPoint,
    HttpHeaders? headers,
    bool formEncode = false,
    bool multipartFormData = false,
    bool auth = true,
  }) async {
    var dio = Dio(); // with default Options
    dio.options.baseUrl = Apis.baseUrl;
    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 3000;
    late Response response;
    try {
      Map<String, String> headers = {
        'Content-Type': formEncode
            ? 'application/x-www-form-urlencoded'
            : multipartFormData
            ? 'multipart/form-data'
            : 'application/json',
        'Accept': 'application/json'
      };
      String token='';
      if (auth) {
        headers['Authorization'] = 'Bearer $token';
      }
      response = await dio
          .post(endPoint.path, queryParameters: queryParameters,
          options: Options(headers: headers));
    } on DioError catch  (e) {
      debugPrint(e.toString());
    }
      return response;
  }

}
