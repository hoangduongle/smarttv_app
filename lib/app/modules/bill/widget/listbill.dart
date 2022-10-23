// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/bill/controller/bill_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class ListBill extends StatelessWidget {
  BillController billController;
  BillDetailContent billDetailContent;
  int index;

  ListBill({
    Key? key,
    required this.billController,
    required this.billDetailContent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return billDetailContent.isNull
        ? Container()
        : Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.r),
            child: InkWell(
              onTap: () {
                debugPrint('Bill: ');
              },
              borderRadius: BorderRadius.circular(5.r),
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
                              "${billDetailContent.service?.name}",
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
                          "${billDetailContent.quantity}", //QUANTITY
                          style: AppStyles.h5.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: naController.select ? 70.w : 85.w),
                      SizedBox(
                        width: 92.w,
                        child: Text(
                          NumberUtils.noVnd(billController
                              .billDetails.value[index].price), //PRICE
                          textAlign: TextAlign.center,
                          style: AppStyles.h5.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: naController.select ? 55.w : 65.w),
                      SizedBox(
                        width: 92.w,
                        child: Text(
                          NumberUtils.noVnd(billDetailContent.amount), //AMOUNT
                          textAlign: TextAlign.center,
                          style: AppStyles.h5.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: naController.select ? 55.w : 55.w),
                      Text(
                        "${billDetailContent.billDate}",
                        textAlign: TextAlign.center,
                        style: AppStyles.h5.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      naController.select
                          ? Container()
                          : SizedBox(
                              width: 90.w,
                              child: Text(
                                billDetailContent.status == 0
                                    ? 'paid'.tr
                                    : 'unpaid'.tr,
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
