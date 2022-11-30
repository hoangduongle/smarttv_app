// ignore_for_file: unrelated_type_equality_checks, await_only_futures, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/turndown/widget/dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class TurndownController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<RequestServiceContent?> requestService = Rx<RequestServiceContent?>(null);
  var bookingId;
  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    bookingId = await prefs.getInt(bookId);
    super.onInit();
  }

  var result;
  Future<void> requestTurndown(int hours, int minutes) async {
    try {
      const LoadingDialog().showLoadingDialog(Get.context!);
      await fetchRequest(
          "${DateTimeUtils.currentDate()} ${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}:00",
          "Dọn phòng nhanh",
          TURNDOWN);
      Get.back();
      if (result == 200) {
        const TurndownDialogWidget()
            .showTurndownDialog(Get.context!, hours, minutes);
      } else if (result == 208) {
        const TurndownDialogWidget().showTurndownDialogBooked(Get.context!);
      }
    } catch (e) {
      debugPrint("Error Turn Down: ${e.toString()}");
      Get.back();
      const TurndownDialogWidget().showTurndownDialogFail(Get.context!);
    }
  }

  Future<void> fetchRequest(String dateTime, String name, String type) async {
    var overview =
        _repository.requestService(bookingId, dateTime, 0, name, type, BOOKED);
    await callDataService(
      overview,
      onSuccess: (int response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
  }

  Future<void> getRequestService() async {
    var overview = _repository.getRequestService(bookingId);
    await callDataService(
      overview,
      onSuccess: (RequestServiceContent response) {
        requestService(response);
      },
      onError: ((dioError) {}),
    );
  }

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
