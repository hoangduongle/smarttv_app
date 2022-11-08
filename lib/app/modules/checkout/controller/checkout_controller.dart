

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
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
    fetchImage("img_checkout");
    super.onInit();
  }

  var result;
  Future<void> requestCheckout() async {
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
  }

  Future<void> fetchRequest(String dateTime, String name) async {
    // debugPrint("$bookingId");
    // debugPrint("$dateTime");
    // debugPrint("$name");
    var overview = _repository.requestService(
        bookingId, dateTime, 0, name, name, StatusService.BOOKED.toString());
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

  Future<void> fetchImage(String type) async {
    var overview = _repository.getListImageByType(type);
    List<ImageContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<ImageContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    imageCheckout(result);
  }
}
