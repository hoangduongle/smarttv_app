// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';

class AbtractionScreen extends GetView<AbtractionController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 42.h, left: 15.w),
                    child: Text(
                      "local".tr,
                      style: AppStyles.h4.copyWith(
                          color: AppColors.header,
                          fontSize: (size.width * 25 / 1000).sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      width: size.width.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.45.r),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Text(
                        "Ngoài những dịch vụ sẵn có, khách sạn còn cung cấp cho quý khách các địa điểm được nhiều khách hàng trước đó trãi nghiệm và đánh giá cao. Từ những địa điểm này mong ràng quý khách có được thời gian trải nghiệm tuyệt với tại khách sạn của chúng tôi.",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),

                  ////////////////////
                ],
              ),
            ),
          ],
        ));
  }
}
/*
Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 42.h, left: 15.w),
                  child: Text(
                    "local".tr,
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: (size.width * 25 / 1000).sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    width: 750.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Text(
                      "Ngoài những dịch vụ sẵn có, khách sạn còn cung cấp cho quý khách các địa điểm được nhiều khách hàng trước đó trãi nghiệm và đánh giá cao. Từ những địa điểm này mong ràng quý khách có được thời gian trải nghiệm tuyệt với tại khách sạn của chúng tôi.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),

                ////////////////////
              ],
            )
 */