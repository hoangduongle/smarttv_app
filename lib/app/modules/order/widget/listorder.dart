// ignore_for_file: must_be_immutable, deprecated_member_use, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';

class ListOrder extends StatefulWidget {
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
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Material(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: () {
            naController.current_index = 13.obs;
            widget.orderController.loadOrderdetails(widget.orderContent.id!);
            naController.orderid = widget.orderContent.id!.obs;
          },
          borderRadius: BorderRadius.circular(10.r),
          focusColor: AppColors.white,
          child: Container(
            width: 100.w,
            height: 50.h,
            margin: EdgeInsets.all(1.r),
            decoration: BoxDecoration(
                color: AppColors.navigabackground,
                borderRadius: BorderRadius.circular(10.r)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      AnimatedPadding(
                          padding: EdgeInsets.only(
                              left: naController.select ? 30.w : 40.w),
                          duration: const Duration(milliseconds: 500)),
                      SizedBox(
                        width: 28.w,
                        child: Text(
                          "${widget.index + 1}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: AppStyles.h5.copyWith(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  AnimatedPadding(
                      padding: EdgeInsets.only(
                          left: naController.select ? 100.w : 130.w),
                      duration: const Duration(milliseconds: 500)),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      "#${widget.orderContent.id}", //QUANTITY
                      textAlign: TextAlign.center,
                      style: AppStyles.h5.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: naController.select ? 75.w : 110.w),
                  SizedBox(
                    width: 130.w,
                    child: Text(
                      NumberUtils.vnd(widget.orderContent.totalAmount), //PRICE
                      textAlign: TextAlign.center,
                      style: AppStyles.h5.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: naController.select ? 40.w : 60.w),
                  SizedBox(
                    width: 86.w,
                    child: Text(
                      "${widget.orderContent.updateDate}",
                      textAlign: TextAlign.center,
                      style: AppStyles.h5.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: naController.select ? 40.w : 80.w),
                  SizedBox(
                    width: 110.w,
                    child: Text(
                      widget.orderContent.orderPayment == null
                          ? "Chờ thanh toán"
                          : "Đã thanh toán",
                      textAlign: TextAlign.center,
                      style: AppStyles.h5.copyWith(
                          color: widget.orderContent.orderPayment == null
                              ? AppColors.lighBlue
                              : AppColors.greenFocus,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
