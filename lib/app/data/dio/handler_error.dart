import 'package:flutter/cupertino.dart';
import 'package:smarttv_app/app/exceptions/app_exception.dart';

Exception handleError(String error) {
  debugPrint("Generic exception: $error");

  return AppException(message: error);
}