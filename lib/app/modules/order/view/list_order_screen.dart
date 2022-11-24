// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/listorder.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/order_dialog.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class ListOrderScreen extends StatefulWidget {
  const ListOrderScreen({super.key});

  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    ScrollController scrollOrderController = ScrollController();
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            child: Column(
              children: [
                TitleScreen(
                  name: "Hoá đơn",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'STT.'.tr,
                      style: AppStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.title,
                      ),
                    ),
                    Text('Mã hoá đơn'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Tổng tiền'.tr,
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
                    Text('Trạng thái'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                controller.orders.value.isEmpty
                    ? Expanded(
                        child: Lottie.asset("assets/lotties/loading.json",
                            width: 200.w))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SizedBox(
                          width: 900.w,
                          height: 300.h,
                          child: RawScrollbar(
                            thumbColor: AppColors.greyColor,
                            thumbVisibility: true,
                            radius: Radius.circular(100.r),
                            thickness: 10,
                            controller: scrollOrderController,
                            child: ListView.separated(
                                controller: scrollOrderController,
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 25.h,
                                    ),
                                itemCount: controller.orders.value.length,
                                itemBuilder: (context, index) {
                                  return ListOrder(
                                      orderController: controller,
                                      orderContent:
                                          controller.orders.value[index],
                                      index: index);
                                }),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 7.h,
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
                        child: Text(NumberUtils.vnd(controller.total),
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
                    color:
                        controller.isPayall ? AppColors.focus : AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      focusColor: controller.isPayall
                          ? AppColors.orangeColor
                          : AppColors.greenFocus,
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {
                        controller.isPayall
                            ? OrderDialog().showOrderDialog(
                                context,
                                controller.getAllOrderIdNotPay(),
                                controller.total)
                            : null;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.isPayall
                                ? 'Thanh toán tất cả'
                                : 'Đã thanh toán',
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
