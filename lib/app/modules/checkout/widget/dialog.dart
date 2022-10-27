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

class CheckoutDialogWidget extends StatelessWidget {
  const CheckoutDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showCheckoutDialog(BuildContext context) {
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
                "Nhân viên đã nhận được yêu cầu check-out của quý khách",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 5.h,
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
