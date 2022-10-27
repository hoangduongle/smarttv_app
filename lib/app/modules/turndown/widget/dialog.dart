// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/cart_dialog_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/turndown/controller/turndown_controller.dart';

class TurndownDialogWidget extends StatelessWidget {
  TurndownDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showTurndownDialog(BuildContext context, TurndownController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        child: SizedBox(
          width: 500.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lotties/done.json", width: 100.w),
              Text(
                "Yêu cầu dọn phòng nhanh của quý khách sẽ được thực hiện vào lúc",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${NumberUtils.time(controller.countHours.toInt())}:${NumberUtils.time(controller.countMinute.toInt())}",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Cám ơn quý khách đã sử dụng dịch vụ của chúng tôi",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(5.r),
                  child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'back'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
            // caController.addService(serviceContent);
          ),
        ),
      ),
    );
  }
}
