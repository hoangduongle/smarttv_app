// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/modules/home/view/home_screen.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading_services.dart';
import 'package:smarttv_app/app/modules/service/binding/service_binding.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service/widget/cardcategory.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 99; i++) {
      FocusNode focus = FocusNode();
      focusNodes.add(focus);
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 99; i++) {
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    ScrollController scrollControllerService = ScrollController();
    return GetBuilder<ServiceController>(
      builder: (controller) {
        return Scaffold(
            body: Container(
                color: AppColors.background,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: AppColors.background,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleScreen(
                            name: "services".tr,
                          ),
                          controller.serviceCateList.value.isEmpty
                              ? SkeletonCategoryService()
                              : Expanded(
                                  child: SizedBox(
                                  width: size.width,
                                  child: RawScrollbar(
                                    controller: scrollControllerService,
                                    thumbColor: AppColors.title,
                                    thumbVisibility: true,
                                    radius: Radius.circular(100.r),
                                    thickness: 10,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              naController.select ? 15.w : 30.w,
                                          vertical: 0.h),
                                      child: GridView.builder(
                                        controller: scrollControllerService,
                                        itemCount: controller
                                            .serviceCateList.value.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              naController.select ? 3 : 4,
                                          crossAxisSpacing:
                                              naController.select ? 50.w : 30.w,
                                          mainAxisSpacing: 30.h,
                                        ),
                                        itemBuilder: (context, index) {
                                          return CardCategory(
                                              index: index,
                                              serviceCategory: controller
                                                  .serviceCateList.value[index],
                                              focusNode: focusNodes[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                )),
                        ],
                      ),
                    )),
                  ],
                )));
      },
    );
  }
}
