// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class ListServiceScreen extends StatefulWidget {
  final String cateName;
  const ListServiceScreen({super.key, required this.cateName});

  @override
  State<ListServiceScreen> createState() => _ListServiceScreenState();
}

class _ListServiceScreenState extends State<ListServiceScreen> {
  ListServiceController controller = Get.find();
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  @override
  Widget build(BuildContext context) {
    Size size = Size(960, 540);

    CartController caController = Get.find();
    return Row(
      children: [
        Expanded(
            child: Container(
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.h, left: 30.w),
                child: Text(
                  widget.cateName,
                  style: AppStyles.h4.copyWith(
                      color: AppColors.header,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: AppColors.greyColor,
                indent: 20.w,
                endIndent: 20.w,
              ),
            ],
          ),
        )),
      ],
    );
  }
}
