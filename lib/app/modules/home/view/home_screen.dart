// ignore_for_file: unused_import, implementation_imports, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/modules/home/binding/home_binding.dart';
import 'package:smarttv_app/app/modules/home/controller/home_controller.dart';
import 'package:smarttv_app/app/modules/home/loading/skeleton_loading_homescreen.dart';
import 'package:smarttv_app/app/modules/home/widget/buildimage.dart';
import 'package:smarttv_app/app/modules/home/widget/buildindicator.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(
      () {
        return SizedBox(
            child: Column(
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
                      "overview".tr,
                      style: AppStyles.h4.copyWith(
                          color: AppColors.header,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: AppColors.greyColor,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    child: controller.overviewList.value.isEmpty
                        ? SkeletonLoadingHomeScreen()
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Column(children: [
                              Center(
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      controller.currentInt = index.obs;
                                    },
                                    enableInfiniteScroll: true,
                                    autoPlayInterval:
                                        const Duration(milliseconds: 3500),
                                    autoPlay: true,
                                    initialPage: 0,
                                    height: (size.height * 7 / 9).h,
                                    viewportFraction: 1,
                                  ),
                                  itemCount:
                                      controller.overviewList.value.length,
                                  itemBuilder: (context, index, realIndex) {
                                    OverviewContent overviewContent =
                                        controller.overviewList.value[index];
                                    return buildImage(
                                        overviewContent, index, size);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              buildIndicator(controller.overviewList.value,
                                  controller.currentInt.value),
                            ])),
                  )
                ],
              ),
            )),
          ],
        ));
      },
    ));
  }
}
