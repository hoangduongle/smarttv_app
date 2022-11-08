import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDebug extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("========================REQUEST========================");
    debugPrint('API debug >> make request: ${options.uri}');
    debugPrint('API debug >> make request: ${options.headers}');
    debugPrint('API debug >> make request: ${options.data}');
    debugPrint("========================REQUEST========================");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("========================RESPONE========================");
    debugPrint('API debug >> http status code: ${response.statusCode}');
    debugPrint('API debug >> response: ${response.data}');
    debugPrint("========================RESPONE========================");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    var response = err.response;
    debugPrint("========================ERROR========================");
    debugPrint('API debug >> http status code: ${response?.statusCode}');
    debugPrint('API debug >> response: ${response?.data}');
    debugPrint("========================ERROR========================");
    super.onError(err, handler);
  }
}
