// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import, unnecessary_import, implementation_imports

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/view/list_service_screen.dart';
import 'package:smarttv_app/app/modules/service_components/widget/card_each_service.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class CardCategory extends StatelessWidget {
  int index;
  ServiceCategoryContent serviceCategory;

  CardCategory({
    Key? key,
    required this.index,
    required this.serviceCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());

    return GetBuilder<ServiceController>(
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            color: AppColors.navigabackground,
            child: InkWell(
              focusColor: AppColors.focus,
              autofocus: index == 0,
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {
                // controller.serviceComponent(serviceCategory);
                Get.toNamed('/service-component/${serviceCategory.id}');
                debugPrint(serviceCategory.id.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.r),
                    color: AppColors.navigabackground),
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 2.h),
                          margin: EdgeInsets.all(10.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                              //serviceCategory.picture!
                              height: naController.select ? 110.h : 90.h,
                              width: naController.select ? 175.w : 148.w,
                              fit: BoxFit.fill,
                              // placeholder: (context, url) =>
                              //     SkeletonLoading(Size(158, 300)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: naController.select ? 15.h : 10.h,
                        ),
                        Text(
                          serviceCategory.name!.tr, //<------ set controller
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.title),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
