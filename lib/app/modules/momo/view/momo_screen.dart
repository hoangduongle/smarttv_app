// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/momo/controller/momo_controller.dart';

class MomoScreen extends GetView<MomoController> {
  const MomoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  void MomoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
            width: 380.w,
            height: 360.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30.h),
                  width: 800.w,
                  child: Text(
                    "Quét mã để thanh toán",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.pink.withOpacity(.85),
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 120.h,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r))),
                              ),
                            ],
                            /*
                          QrImage(
                                foregroundColor: AppColors.black,
                                data: "https://urlgeni.us/facebook/L7AX",
                                version: QrVersions.auto,
                                size: 190.0,
                              ),
                           */
                          ),
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: QrImage(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.black,
                            data:
                                "https://test-payment.momo.vn/gw_payment/s/zoVKZd",
                            // data: "https://urlgeni.us/facebook/L7AX",
                            version: QrVersions.auto,
                            size: 190.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: Material(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      focusColor: AppColors.greenFocus,
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 20.r,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'back'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
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
