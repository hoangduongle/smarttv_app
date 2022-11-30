// ignore_for_file: await_only_futures, unused_field

import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class NotificationController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<MessageContent>> messages = Rx<List<MessageContent>>([]);
  late Timer _timer;

  @override
  Future<void> onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt(bookId);
    fetchMessages(bookingId!);
    refreshMessage();
    super.onInit();
  }

  void refreshMessage() {
    _timer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) async {
        // debugPrint("${DateTime.now().minute} ${DateTime.now().second}");
        final prefs = await SharedPreferences.getInstance();
        var bookingId = await prefs.getInt(bookId);
        fetchMessages(bookingId!);
        // debugPrint("Auto refersh Notification");
        update();
      },
    );
  }

  Future<void> fetchMessages(int bookingId) async {
    var servicecate = _repository.getListMessage(bookingId);
    List<MessageContent> result = [];
    await callDataService(
      servicecate,
      onSuccess: (List<MessageContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    messages(result);
    // debugPrint(serviceCateListTMP.value.length.toString());
  }
}
