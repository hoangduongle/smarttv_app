// ignore_for_file: unused_local_variable, await_only_futures

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/feedback/models/radioButton.dart';

class FeedbackController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<FeedbackContent>> listFeedback = Rx<List<FeedbackContent>>([]);

  FeedbackState state = FeedbackState.normal;
  List<FeedbackState> list = [FeedbackState.normal];

  @override
  void onInit() {
    for (int i = 0; i < 9; i++) {
      list.add(state);
    }
    fetchFeedback();
    super.onInit();
  }

  Future<void> insertAllFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt("bookingId");
    for (int i = 0; i < listFeedback.value.length; i++) {
      CustomerFeedback customerFeedback = CustomerFeedback(
        booking: BookingContent(id: bookingId),
        dateTime: DateTimeUtils.currentDateTime(),
        feedbackContent: listFeedback.value[i],
        id: 0,
        rating: list[i].index + 1,
      );
      insertCustomerFeedBack(customerFeedback);
    }
  }

  Future<int> insertCustomerFeedBack(CustomerFeedback customerFeedback) async {
    var overview = _repository.insertCustomerFeedback(customerFeedback);
    int result = 0;
    await callDataService(
      overview,
      onSuccess: (response) {
        // debugPrint("${response}");
        result = response;
      },
      onError: ((dioError) {}),
    );
    return result;
  }

  Future<void> fetchFeedback() async {
    var overview = _repository.getListFeedbackContent();
    List<FeedbackContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<FeedbackContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    listFeedback(result);
  }
}
