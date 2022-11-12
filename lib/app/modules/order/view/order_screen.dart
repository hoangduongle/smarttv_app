// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/listorderdetail.dart';
import 'package:smarttv_app/app/modules/order/widget/order_dialog.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            child: Column(
              children: [
                TitleScreen(
                  name:
                      "Mã Hoá Đơn: #${controller.order.value?.id ?? '00000'}", 
                      //${controller.order.value?.id ?? '00000'}${naController.orderid}
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'service'.tr,
                      style: AppStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.title,
                      ),
                    ),
                    Text('quantity'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('unitprice'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Ngày',
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('totalamout'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                controller.orderDetails.value.isEmpty
                    ? Expanded(
                        child: Lottie.asset("assets/lotties/loading.json"))
                    : Expanded(
                        child: RawScrollbar(
                        thumbColor: AppColors.white,
                        thumbVisibility: true,
                        radius: Radius.circular(100.r),
                        thickness: 10,
                        controller: scrollController,
                        child: SizedBox(
                          width: 870.w,
                          child: ListView.separated(
                              controller: scrollController,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 25.h,
                                  ),
                              itemCount: controller.orderDetails.value.length,
                              itemBuilder: (context, index) => ListOrderDetail(
                                    orderDetailContent:
                                        controller.orderDetails.value[index],
                                    orderController: controller,
                                    index: index,
                                  )),
                        ),
                      )),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Divider(
                    color: AppColors.white,
                    height: 20.h,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('totalcost'.tr,
                            style: AppStyles.h4.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.title,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                            NumberUtils.vnd(
                                controller.order.value?.totalAmount ??
                                    0), //controller.bill.value?.totalAmount ??
                            style: AppStyles.h4.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 170.w,
                  height: 50.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {
                        OrderDialog().showOrderDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'pay'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
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
            ),
          ),
        );
      },
    );
  }
}
