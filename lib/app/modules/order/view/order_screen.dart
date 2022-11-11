// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/widget/listorder.dart';
import 'package:smarttv_app/app/modules/order/widget/order_dialog.dart';
import 'package:smarttv_app/app/modules/order/widget/listorderdetail.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: SizedBox(
                    width: 900.w,
                    height: 450.h,
                    child: RawScrollbar(
                      thumbColor: AppColors.greyColor,
                      thumbVisibility: true,
                      radius: Radius.circular(100.r),
                      thickness: 10,
                      controller: scrollOrderController,
                      child: GridView.builder(
                        controller: scrollOrderController,
                        shrinkWrap: true,
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 210.w, //220
                          crossAxisCount: naController.select ? 3 : 4,
                          crossAxisSpacing: naController.select ? 60.w : 20.w,
                          mainAxisSpacing: 20.h,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: ListOrder(
                                orderContent: OrderContent(),
                                orderController: controller,
                                index: index),
                          );
                        },
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
