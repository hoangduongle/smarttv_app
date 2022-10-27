// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

class TurndownController extends BaseController {
  var countHours = 8.obs;
  var countMinute = 0.obs;

  void incrementHours() {
    countHours++;
  }

  void decrementHours() {
    countHours--;
  }

  void incrementMinute() {
    
    countMinute++;
  }

  void decrementMinute() {
    countMinute--;
  }
}
