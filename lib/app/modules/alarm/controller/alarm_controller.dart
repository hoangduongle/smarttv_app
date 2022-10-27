// ignore_for_file: unused_field
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

class AlarmController extends BaseController {
  var hours = 9.obs;
  var minutes = 0.obs;

  void incrementHours() {
    hours++;
  }

  void decrementHours() {
    hours--;
  }

  void incrementMinute() {
    minutes++;
  }

  void decrementMinute() {
    minutes--;
  }
}
