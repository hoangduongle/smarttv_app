// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';

class ListOrder extends StatelessWidget {
  OrderController orderController;
  OrderContent orderContent;
  int index;

  ListOrder({
    Key? key,
    required this.orderController,
    required this.orderContent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.greyColor,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        // autofocus: index == 0,
        borderRadius: BorderRadius.circular(10.r),
        focusColor: AppColors.orangeColor,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1.r),
          decoration: BoxDecoration(
              color: AppColors.navigabackground,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Mã hoá đơn", //<------ set controller
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
              ),
              Text(
                "#138789", //<------ set controller
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Tổng tiền", //<------ set controller
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
              ),
              Text(
                "100.000.000 VNĐ", //<------ set controller
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                //"Đã thanh toán"
                //"Chờ thanh toán"
                "Đã thanh toán",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenFocus),
                //AppColors.lighBlue
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "xem chi tiết", //<------ set controller
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.title),
              ),
              Container(
                width: 85.w,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.title, width: 1.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
