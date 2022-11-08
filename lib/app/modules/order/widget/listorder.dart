// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class ListOrder extends StatelessWidget {
  OrderController orderController;
  OrderDetailContent orderDetailContent;
  int index;
  FocusNode focus;

  ListOrder({
    Key? key,
    required this.orderController,
    required this.orderDetailContent,
    required this.index,
    required this.focus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () {},
        focusNode: focus,
        borderRadius: BorderRadius.circular(10.r),
        focusColor: AppColors.focus,
        child: Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    AnimatedPadding(
                        padding: EdgeInsets.only(
                            left: naController.select ? 25.w : 15.w),
                        duration: const Duration(milliseconds: 500)),
                    SizedBox(
                      width: 130.w,
                      child: Text(
                        "${orderDetailContent.service?.name}",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: AppStyles.h5.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40.w,
                ),
                SizedBox(
                  width: 30.w,
                  child: Text(
                    "${orderDetailContent.quantity}", //QUANTITY
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: naController.select ? 70.w : 85.w),
                SizedBox(
                  width: 92.w,
                  child: Text(
                    NumberUtils.noVnd(orderController
                        .orderDetails.value[index].price), //PRICE
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: naController.select ? 55.w : 65.w),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    orderDetailContent.status == 0 ? 'paid'.tr : 'unpaid'.tr,
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: naController.select ? 55.w : 55.w),
                SizedBox(
                  width: 86.w,
                  child: Text(
                    "${orderDetailContent.billDate}",
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                naController.select
                    ? Container()
                    : SizedBox(
                        width: 92.w,
                        child: Text(
                          NumberUtils.noVnd(orderDetailContent.amount), //AMOUNT
                          textAlign: TextAlign.center,
                          style: AppStyles.h5.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
