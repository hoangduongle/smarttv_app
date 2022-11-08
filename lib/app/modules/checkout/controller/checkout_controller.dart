// ignore_for_file: await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

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

  Future<void> fetchRequest(String dateTime, String name) async {
    int result = 0;
    // debugPrint("$bookingId");
    // debugPrint("$dateTime");
    // debugPrint("$name");
    var overview = _repository.requestService(bookingId.toInt(), dateTime, 0,
        name, name, StatusService.BOOKED.toString());
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
