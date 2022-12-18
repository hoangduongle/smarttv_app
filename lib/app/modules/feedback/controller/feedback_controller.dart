// ignore_for_file: unused_local_variable, await_only_futures, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/feedback/models/radioButton.dart';

class FeedbackController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<FeedbackContent>> listFeedback = Rx<List<FeedbackContent>>([]);
  Rx<List<CustomerFeedback>> customerFeedBack = Rx<List<CustomerFeedback>>([]);

  FeedbackState state = FeedbackState.normal;
  List<FeedbackState> list = [FeedbackState.normal];
  bool checkLoading = true;
  var bookingId;

  @override
  void onInit() async {
    for (int i = 0; i < 9; i++) {
      list.add(state);
    }
    await fetchFeedback();
    super.onInit();
  }

  @override
  void onReady() async {
    final prefs = await SharedPreferences.getInstance();
    bookingId = await prefs.getInt(bookId);
    await fetchListCustomerFeedback(bookingId);
    checkExitFeedBack();
    super.onReady();
  }

  Future<void> fetchListCustomerFeedback(int bookingId) async {
    var overview = _repository.getListCustomerFeedback(bookingId);
    List<CustomerFeedback> result = [];
    await callDataService(
      overview,
      onSuccess: (List<CustomerFeedback> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    customerFeedBack(result);
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

  void checkExitFeedBack() {
    if (customerFeedBack.value.isEmpty) {
      insertAllFeedback();
    } else {
      debugPrint("Not Empty");
    }
  }

  Future<void> insertAllFeedback() async {
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
    fetchListCustomerFeedback(bookingId);
  }

  Future<void> insertCustomerFeedBack(CustomerFeedback customerFeedback) async {
    var overview = _repository.insertCustomerFeedback(customerFeedback);

    int result = -1;
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
  }

  void updateFeedback() async {
    debugPrint(customerFeedBack.value.isNotEmpty.toString());
    if (customerFeedBack.value.isNotEmpty) {
      if (checkLoading) {
        showThanksDialog(Get.context!);
        checkLoading = false;
        for (int i = 0; i < customerFeedBack.value.length; i++) {
          CustomerFeedback customerFeedback = CustomerFeedback(
            booking: BookingContent(id: bookingId),
            dateTime: DateTimeUtils.currentDateTime(),
            feedbackContent: listFeedback.value[i],
            id: customerFeedBack.value[i].id,
            rating: list[i].index + 1,
          );
          updateCustomerFeedBack(customerFeedback);
        }
        Future.delayed(const Duration(seconds: 2), () => Get.back());
        Future.delayed(const Duration(minutes: 10), () => checkLoading = true);
      } else {
        showWaitDialog(Get.context!);
        Future.delayed(const Duration(seconds: 2), () => Get.back());
      }
    }
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

  void showThanksDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 460.w,
              height: 250.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Lottie.asset(AppAssets.done, width: 130),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Đánh giá của bạn đã được ghi nhận",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Xin cảm ơn những đóng góp của quý khách",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  void showWaitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 460.w,
              height: 250.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Lottie.asset(AppAssets.loadingDongHo, width: 130),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Xin quý khách đợi 10 phút sau để thực hiện đánh giá",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Xin cảm ơn những đóng góp của quý khách",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
