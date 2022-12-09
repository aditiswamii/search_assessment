import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_apis.dart';

class ApiProvider {
  Future<Response<String>> get(
    String endPoint,
    Map<String, dynamic>? queryParameters,
  ) async {
    BaseOptions options = BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: 3000,
        receiveTimeout: 3000,
        method: 'GET');
    Dio dio = Dio(options);
    late Response<String> response;
    try {
      response = await dio.request(endPoint, queryParameters: queryParameters);
      if (kDebugMode) {
        print(response);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }
}
