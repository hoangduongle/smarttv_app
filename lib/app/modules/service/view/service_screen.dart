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

class ServiceScreen extends GetView<ServiceController> {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
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
                      Container(
                        padding: EdgeInsets.only(top: 25.h, left: 30.w),
                        child: Text(
                          'services'.tr,
                          style: AppStyles.h4.copyWith(
                              color: AppColors.header,
                              fontSize: (size.width * 0.02).sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        color: AppColors.greyColor,
                        indent: 20.w,
                        endIndent: 20.w,
                      ),
                      controller.serviceCateList.value.isEmpty
                          ? SkeletonLoadingServiceScreen()
                          : Expanded(
                              child: SizedBox(
                              width: size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: GridView.builder(
                                  itemCount:
                                      controller.serviceCateList.value.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: naController.select ? 3 : 4,
                                    crossAxisSpacing: 45.w,
                                    mainAxisSpacing: 30.h,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CardCategory(
                                        index: index,
                                        serviceCategory: controller
                                            .serviceCateList.value[index]);
                                  },
                                ),
                              ),
                            )),
                    ],
                  ),
                )),
              ],
            )));
  }
}
