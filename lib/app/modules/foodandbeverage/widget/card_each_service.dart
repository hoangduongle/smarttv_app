// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import, unnecessary_import, implementation_imports, unnecessary_string_interpolations, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/model/mayjor_content.dart';

import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/view/fandb_majorgroud.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/dialog.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';
import 'package:smarttv_app/app/widget/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/card_each_service.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';

class CardEachService extends StatefulWidget {
  int index;
  MayjorContent mayjorContent;

  CardEachService({
    Key? key,
    required this.index,
    required this.mayjorContent,
  }) : super(key: key);

  @override
  State<CardEachService> createState() => _CardEachServiceState();
}

class _CardEachServiceState extends State<CardEachService> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return GetBuilder<FoodandBeverageController>(
      builder: (controller) {
        return Material(
          color: AppColors.transparent,
          child: InkWell(
            autofocus: widget.index == 0,
            focusColor: AppColors.title,
            borderRadius: BorderRadius.circular(10.r),
            onTap: () {
              Get.to(() => FandBMayjorScreen(
                  mayjorId: widget.mayjorContent.id,
                  mayjorName: widget.mayjorContent.name));
            },
            child: Stack(
              children: [
                Container(
                  color: AppColors.transparent,
                  child: Align(
                    alignment: Alignment(0, 0.97),
                    child: Text(
                      "${widget.mayjorContent.name}", //<------ set controller
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
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${widget.mayjorContent.image.isEmpty ? "https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg" : widget.mayjorContent.image}",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          alignment: Alignment.topCenter,
                          width: 200.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Container(
                          alignment: Alignment.topCenter,
                          width: 200.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image:
                                  NetworkImage("${AppAssets.loadImageNetWork}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
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
