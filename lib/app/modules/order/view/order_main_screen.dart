// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/view/list_order_screen.dart';
import 'package:smarttv_app/app/modules/order/view/order_screen.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class OrderMainScreen extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return controller.orders.value.isEmpty
        ? Scaffold(
            body: Container(
                color: AppColors.background,
                child: Column(
                  children: [
                    TitleScreen(
                      name: "Hoá đơn",
                    ),
                    Expanded(
                        child: Lottie.asset("assets/lotties/loading.json",
                            width: 300.w)),
                  ],
                )))
        : controller.orders.value.length <= 1
            ? OrderScreen()
            : ListOrderScreen();
  }
}
/*
controller.orders.value.isEmpty? Expanded(child: Lottie.asset("assets/lotties/loading.json")):
 controller.orders.value.length <= 1 ? OrderScreen() : ListOrderScreen();
*/