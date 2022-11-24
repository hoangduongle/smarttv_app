// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/core/controller/cart_dialog_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class DialogCart extends StatelessWidget {
  const DialogCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showCartDialog(
      BuildContext context, ServiceContent serviceContent, int quantity) {
    CartController caController = Get.find();
    CartdialogController controller = Get.find();
    controller.count = quantity.obs;
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
              width: 220.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl:
                      'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcSxLr0EfOo_znMX-DYtQVeYFvNzAF4Xw3Ny8nm9RZqlS0QdgFMCBN81LtQxXfqj_1EviZSW9_zWBuBi6wLLtjA',
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 120,
              child: Text(
                serviceContent.name!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    splashRadius: 12,
                    color: AppColors.focus,
                    onPressed: () {
                      if (controller.count >= 1) {
                        controller.decrement();
                      }
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
                  child: Obx(
                    () => Material(
                      color: controller.count == 0
                          ? AppColors.red.withOpacity(0.8)
                          : AppColors.focus,
                      borderRadius: BorderRadius.circular(10.r),
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        focusColor: controller.count == 0
                            ? AppColors.red
                            : AppColors.orangeColor,
                        onTap: () {
                          Get.back();
                          caController.updateService(
                              serviceContent, controller.count.value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //controller.count
                            Text(
                              controller.count == 0 ? 'delete'.tr : 'save'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
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
        ),
      ),
    );
  }

  void showFailDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 460.w,
              height: 300.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Lottie.asset("assets/lotties/uncheck.json", width: 130),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Xin lỗi đã mang trải nghiệm không tốt đến quý khách",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Hệ thống gặp sự cố, xin quý khách thực hiện lại.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: Material(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10.r),
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        autofocus: true,
                        focusColor: AppColors.greenFocus,
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'back'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  void showThanksDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 460.w,
              height: 250.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Lottie.asset("assets/lotties/done.json", width: 130),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Yêu cầu của quý khách đang được chuẩn bị",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Cám ơn quý khách đã sử dụng dịch vụ của chúng tôi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
