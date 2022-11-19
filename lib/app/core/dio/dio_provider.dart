import 'package:dio/dio.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';

import 'dio_debug.dart';

class DioProvider {
  static const String baseUrl = "https://hotelservice-v5.herokuapp.com/api/v1";
  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      // _instance!.interceptors.add(DioDebug()); // For debug

      return _instance!;
    } else {
      _instance!.interceptors.clear(); // For debug
      // _instance!.interceptors.add(DioDebug()); // For debug
      return _instance!;
    }
  }

  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(TokenManager.instance);
    // _instance!.interceptors.add(DioDebug()); // For debug
  }
}
