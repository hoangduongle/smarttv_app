// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';

import 'package:smarttv_app/app/modules/service_components/controller/cart_dialog_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class DialogCart extends StatelessWidget {
  const DialogCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

/*
lấy dữ liệu   
  final CartController controller;
  final ServiceContent serviceContent;
  final int quantity;
  final int index;

cho phép người dùng chỉnh số lượng tăng giảm
khi bấm Lưu sẽ set lại quantity được hiển thị của service đó

nếu người dùng bấm xoá sẽ remove service đó khỏi cart



*/
  void showCustomeDialog(
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
                  placeholder: (context, url) =>
                      SkeletonLoading(Size(220, 130)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 120,
              child: Text(
                serviceContent.name!, //<------ set controller
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
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
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
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
                        caController.updateService(
                            serviceContent, controller.count.value);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //controller.count
                          Obx(
                            () => Text(
                              controller.count == 0 ? 'delete'.tr : 'save'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
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
