// ignore_for_file: prefer_typing_uninitialized_variables, await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/checkout/widget/dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class CheckoutController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageCheckout = Rx<List<ImageContent>>([]);
  var bookingId;
  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    bookingId = await prefs.getInt("bookingId");
    super.onInit();
  }

  var result;
  Future<void> requestCheckout() async {
    try {
      const LoadingDialog().showLoadingDialog(Get.context!);
      DateTime dateTime = DateTime.now();
      await fetchRequest(
          "${NumberUtils.time(dateTime.hour)}:${NumberUtils.time(dateTime.minute)}",
          "CheckOut");
      Get.back();
      if (result == 200) {
        const CheckoutDialogWidget().showCheckoutDialog(Get.context!);
      } else {
        const CheckoutDialogWidget().showUncheckDialog(Get.context!);
      }
    } catch (e) {
      debugPrint("Error Checkout: ${e.toString()}");
      Get.back();
      const CheckoutDialogWidget().showUncheckDialog(Get.context!);
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
  }
}
