// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/receptionist/controller/receptionist_controller.dart';

class ReceptionistScreen extends GetView<ReceptionistController> {
  const ReceptionistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  void receptionistDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: SizedBox(
            width: 400.w,
            height: 250.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30.h),
                  width: 800.w,
                  child: Text(
                    "Đã thông tin đến lễ tân",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                  child: Text(
                    "Cảm ơn bạn đã chọn khách sạn của chúng tôi 💛",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 35.h,
                  child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: Text(
                      "close".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    icon: Icon(
                      Icons.close,
                      size: 25.r,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.green,
                    elevation: 1,
                    focusElevation: 2,
                    focusColor: AppColors.greenFocus,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}