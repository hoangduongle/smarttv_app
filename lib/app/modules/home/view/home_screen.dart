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
import 'package:smarttv_app/app/values/app_assets.dart';
import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_styles.dart';

class HomePage extends GetView<HomeController> {
 

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     int currentIndex = 0;
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
                    padding: EdgeInsets.only(top: 42.h, left: 15.w),
                    child: Text(
                      "home".tr,
                      style: AppStyles.h4.copyWith(
                          color: AppColors.header,
                          fontSize: (size.width * 25 / 1000).sp,
                          fontWeight: FontWeight.bold),
                    ),
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
                                      currentIndex = index;
                                    },
                                    enableInfiniteScroll: true,
                                    autoPlayInterval:
                                        const Duration(milliseconds: 3500),
                                    autoPlay: true,
                                    initialPage: 0,
                                    height: (size.height * 7 / 10).h,
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
                              buildIndicator(
                                  controller.overviewList.value, currentIndex)
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
