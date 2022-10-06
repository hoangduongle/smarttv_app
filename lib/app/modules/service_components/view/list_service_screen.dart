// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';

import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/service_components/widget/card_each_service.dart';

class ListSerivceScreen extends GetView<ListServiceController> {
  String cateId;
  ListSerivceScreen({
    super.key,
    required this.cateId,
  });

  @override
  Widget build(BuildContext context) {
    Size size = Size(960, 540);
    controller.serviceId = int.parse(cateId);
    CartController caController = Get.find(tag: CartController().toString());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment(0.63, -0.94),
            child: SizedBox(
              height: 35.h,
              child: FloatingActionButton.extended(
                heroTag: "btn1",
                label: Text(
                  "0",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                icon: Icon(
                  FluentIcons.cart_20_filled,
                  size: 25.r,
                  color: AppColors.black,
                ),
                backgroundColor: AppColors.focus,
                elevation: 1,
                focusElevation: 2,
                focusColor: AppColors.orangeColor,
                onPressed: () {
                  Get.toNamed("/cart");
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.95, -0.94),
            child: SizedBox(
              height: 35.h,
              child: FloatingActionButton.extended(
                heroTag: "btn2",
                label: Text(
                  "Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                icon: Icon(
                  Icons.arrow_back,
                  size: 25.r,
                  color: AppColors.black,
                ),
                backgroundColor: AppColors.green,
                elevation: 1,
                focusElevation: 2,
                focusColor: AppColors.greenFocus,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: AppColors.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 25),
                    child: Text(
                      "Thức ăn ${cateId}",
                      style: AppStyles.h4.copyWith(
                          color: AppColors.title,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 25 / 1000),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: GridView.builder(
                        itemCount: 2,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 60,
                          mainAxisSpacing: 36,
                          mainAxisExtent: 210,
                        ),
                        itemBuilder: (context, index) => CardEachService(
                              index: index,
                            )),
                  )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
