// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/listorderdetail.dart';
import 'package:smarttv_app/app/modules/order/widget/order_dialog.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class OrderScreen extends GetView<OrderController> {
  OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    int orderId = naController.orderid.toInt();
    // if (controller.orders.value.length == 1) {
    //   orderId = controller.orders.value.first.id!.toInt();
    // } else if (controller.orders == null) {
    //   orderId = -1;
    // } else {
    //   orderId = naController.orderid.toInt();
    // }
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            controller.orders.value.isEmpty
                ? TitleScreen(
                    name: "",
                  )
                : TitleScreen(
                    name:
                        "Mã Hoá Đơn: #$orderId", //${controller.order.value?.id ?? '00000'}
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
            //&& controller.orderPayment == null
            controller.orderDetails.value.isEmpty
                ? Expanded(child: Lottie.asset(AppAssets.loading))
                : Expanded(
                    child: RawScrollbar(
                    thumbColor: AppColors.greyColor,
                    thumbVisibility: true,
                    radius: Radius.circular(100.r),
                    thickness: 10,
                    controller: scrollController,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.w),
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
                controller.getOrderPaymentByOrderId(orderId)
                    ? Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment(-0.6, 1),
                          child: Text('Phương thức thanh toán'.tr,
                              style: AppStyles.h4.copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    : Expanded(flex: 2, child: Container()),
                Expanded(flex: 1, child: Container()),
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
                controller.orderDetails.value.isEmpty
                    ? controller.getOrderPaymentByOrderId(orderId)
                        ? Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment(-0.35, 1),
                              child: Text(
                                  controller.getPaymentMethodByOrderId(orderId),
                                  style: AppStyles.h4.copyWith(
                                      fontSize: 20.sp,
                                      color: AppColors.title,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        : Container()
                    : Expanded(flex: 2, child: Container()),
                Expanded(flex: 1, child: Container()),
                controller.orderDetails.value.isEmpty
                    ? Expanded(child: Container())
                    : Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              NumberUtils.vnd(
                                  controller.getOrderTotal(orderId)),
                              style: AppStyles.h4.copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
              ],
            ),
            controller.orderDetails.value.isEmpty
                ? SizedBox(
                    width: 170.w,
                    height: 50.h,
                  )
                : SizedBox(
                    width: 170.w,
                    height: 50.h,
                    child: Material(
                      color: controller.getOrderPaymentByOrderId(orderId)
                          ? AppColors.greyColor
                          : AppColors.focus,
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        focusColor: controller.getOrderPaymentByOrderId(orderId)
                            ? AppColors.greyColor
                            : AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {
                          if (controller.getOrderPaymentByOrderId(orderId)) {
                            return;
                          } else {
                            List<String> listorderId = [];
                            listorderId.add(orderId.toString());
                            OrderDialog().showOrderDialog(context, listorderId,
                                controller.getOrderTotal(orderId));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.getOrderPaymentByOrderId(orderId)
                                  ? 'Đã thanh toán'
                                  : 'pay'.tr,
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
  }
}
