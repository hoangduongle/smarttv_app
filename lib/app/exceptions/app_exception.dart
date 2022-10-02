

import 'package:smarttv_app/app/exceptions/base_exception.dart';

class AppException extends BaseException {
  AppException({
    String message = "",
    String detail = "",
  }) : super(message: message, detail: detail);
}
