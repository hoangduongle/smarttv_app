// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import, unnecessary_import, implementation_imports, unnecessary_string_interpolations, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/card_each_service.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/view/list_service_screen.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';

class CardCategory extends StatelessWidget {
  int index;
  ServiceCategoryContent serviceCategory;
  FocusNode focusNode;

  CardCategory({
    Key? key,
    required this.index,
    required this.serviceCategory,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodandBeverageController fbController = Get.find();
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ServiceController>(
      builder: (controller) {
        return Material(
          color: AppColors.transparent,
          child: InkWell(
            focusColor: AppColors.title,
            borderRadius: BorderRadius.circular(5.r),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setInt('cateId', serviceCategory.id!);

              switch (serviceCategory.id) {
                case 1: //F&B
                  fbController.numberSelected = 0.obs;
                  Get.toNamed('${Routes.FANDB}');
                  break;
                case 3: //Ho boi
                  naController.current_index = 7.obs;
                  break;
                case 4: //dua don san bay
                  naController.current_index = 8.obs;
                  break;
                case 5: //massage thu gian
                  naController.current_index = 9.obs;
                  break;
                case 6: //turn down
                  naController.current_index = 10.obs;
                  break;
                case 7: //checkout
                  naController.current_index = 11.obs;
                  break;
                case 8: //alarm
                  naController.current_index = 12.obs;
                  break;
              }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Stack(
                children: [
                  Container(
                    color: AppColors.transparent,
                    height: (size.height - 100).h,
                    width: size.width.w,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        serviceCategory.name!.tr, //<------ set controller
                        style: TextStyle(
                            fontSize: naController.select ? 20.sp : 17.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.network(
                        "https://statics.vinpearl.com/dia-diem-ngam-hoang-hon-nha-trang-01_1635591021.jpg",
                        width: 200.w,
                        height: naController.select ? 180.h : 160.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
