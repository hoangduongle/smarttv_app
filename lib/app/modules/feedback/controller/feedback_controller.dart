// ignore_for_file: unused_local_variable, await_only_futures

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/feedback/models/radioButton.dart';

class FeedbackController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<FeedbackContent>> listFeedback = Rx<List<FeedbackContent>>([]);
  Rx<List<CustomerFeedback>> customerFeedBack = Rx<List<CustomerFeedback>>([]);

  FeedbackState state = FeedbackState.normal;
  List<FeedbackState> list = [FeedbackState.normal];

  @override
  void onInit() async {
    for (int i = 0; i < 9; i++) {
      list.add(state);
    }
    fetchFeedback();

    super.onInit();
  }

  @override
  void onReady() async {
    // await insertAllFeedback();
    super.onReady();
  }

  void updateFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt(bookId);
    for (int i = 0; i < listFeedback.value.length; i++) {
      CustomerFeedback customerFeedback = CustomerFeedback(
        booking: customerFeedBack.value[i].booking,
        dateTime: DateTimeUtils.currentDateTime(),
        feedbackContent: listFeedback.value[i],
        id: customerFeedBack.value[i].id,
        rating: list[i].index + 1,
      );
      updateCustomerFeedBack(customerFeedback);
    }
  }

  Future<void> insertAllFeedback() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt(bookId);
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

  Future<void> insertCustomerFeedBack(CustomerFeedback customerFeedback) async {
    var overview = _repository.insertCustomerFeedback(customerFeedback);
    List<CustomerFeedback> result = [];

    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    customerFeedBack(result);
  }

  Future<int> updateCustomerFeedBack(CustomerFeedback customerFeedback) async {
    var overview = _repository.updateCustomerFeedback(customerFeedback);
    int result = 0;
    await callDataService(
      overview,
      onSuccess: (response) {
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
