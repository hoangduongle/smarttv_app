// ignore_for_file: unrelated_type_equality_checks, await_only_futures, prefer_typing_uninitialized_variables
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/turndown/widget/dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class TurndownController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageTurndown = Rx<List<ImageContent>>([]);
  Rx<RequestServiceContent?> requestService = Rx<RequestServiceContent?>(null);
  var bookingId;
  @override
  void onInit() async {
    // fetchImage("img_turndown");
    final prefs = await SharedPreferences.getInstance();
    bookingId = await prefs.getInt("bookingId");

    super.onInit();
  }

  var result;
  Future<void> requestTurndown(int hours, int minutes) async {
    try {
      const LoadingDialog().showLoadingDialog(Get.context!);
      DateTime dateTime = DateTime.now();
      await fetchRequest(
          "${NumberUtils.time(dateTime.hour)}:${NumberUtils.time(dateTime.minute)}",
          "TurnDown");
      Get.back();
      // debugPrint("Request Service: ${result.toString()}");
      if (result == 200) {
        const TurndownDialogWidget()
            .showTurndownDialog(Get.context!, hours, minutes);
      } else {
        const TurndownDialogWidget().showTurndownDialogFail(Get.context!);
      }
    } catch (e) {
      debugPrint("Error Turn Down: ${e.toString()}");
      Get.back();
      const TurndownDialogWidget().showTurndownDialogFail(Get.context!);
    }
  }

  Future<void> fetchRequest(String dateTime, String name) async {
    var overview = _repository.requestService(
        bookingId, dateTime, 0, name, name, "BOOKED");
    await callDataService(
      overview,
      onSuccess: (int response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    // debugPrint("Request Service: ${result.toString()}");
    // debugPrint("$order");
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

  // Future<void> fetchImage(String type) async {
  //   var overview = _repository.getListImageByType(type);
  //   List<ImageContent> result = [];
  //   await callDataService(
  //     overview,
  //     onSuccess: (List<ImageContent> response) {
  //       result = response;
  //     },
  //     onError: ((dioError) {}),
  //   );
  //   imageTurndown(result);
  // }
}
