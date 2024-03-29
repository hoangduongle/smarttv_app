// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/core/controller/cart_dialog_controller.dart';

class DialogWidget extends StatelessWidget {
  int index;
  ServiceContent serviceContent;
  DialogWidget({
    Key? key,
    required this.index,
    required this.serviceContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showServiceDialog(BuildContext context, ServiceContent serviceContent) {
    CartController caController = Get.find();
    CartdialogController controller = Get.find();
    controller.count = 1.obs;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.h),
              width: 180.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: serviceContent.image == null
                      ? "https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg"
                      : "${serviceContent.image?.pictureUrl}",
                  height: 150,
                  fit: BoxFit.cover,
                  // placeholder: (context, url) =>
                  //     SkeletonLoading(Size(220, 130)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 220,
              child: Text(
                serviceContent.name!, //<------ set controller
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 200,
              child: Text(
                NumberUtils.vnd(serviceContent.price), //<------ set controller
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    splashRadius: 12,
                    color: AppColors.focus,
                    onPressed: () {
                      if (controller.count > 1) controller.decrement();
                    },
                    icon: Icon(Icons.remove_circle),
                    focusColor: AppColors.orangeColor),
                Obx(
                  () => Text(controller.count.toString(),
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                    autofocus: true,
                    color: AppColors.focus,
                    splashRadius: 12,
                    onPressed: () {
                      if (controller.count < 99) controller.increment();
                    },
                    icon: Icon(Icons.add_circle),
                    focusColor: AppColors.orangeColor)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: Material(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      focusColor: AppColors.greenFocus,
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'close'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  width: 100.w,
                  height: 30.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
                      onTap: () {
                        Get.back();
                        caController.addService(
                            serviceContent, controller.count.value);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'addf&b'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
          // caController.addService(serviceContent);
        ),
      ),
    );
  }
}
