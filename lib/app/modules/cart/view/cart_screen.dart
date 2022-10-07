// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/modules/bill/controller/bill_controller.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/cart/widget/dialog.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BillController billController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("cart".tr,
                style: AppStyles.h4.copyWith(
                    color: AppColors.header,
                    fontSize: (size.width * 40 / 1000).sp)),
          ),
          SizedBox(
            height: 38.h,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80.w,
                    ),
                    Text(
                      'namefood'.tr,
                      style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title),
                    ),
                    SizedBox(
                      width: 270.w,
                    ),
                    Text('unitprice'.tr,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.title)),
                    SizedBox(
                      width: 110.w,
                    ),
                    Text('quantity'.tr,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.title)),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text('totalamout'.tr,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.title)),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70.w,
            ),
            child: Divider(
              color: AppColors.white,
              height: 20.h,
              thickness: 1,
            ),
          ),
          Obx(
            () => SizedBox(
              width: (size.width * .9).w,
              height: 180.h,
              child: ListView.separated(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.services.length,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                  //
                  itemBuilder: (context, index) => CartService(
                      controller: controller,
                      serviceContent: controller.services.keys.toList()[index],
                      quantity: controller.services.values.toList()[index],
                      index: index)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 70.w,
            ),
            child: Divider(
              color: AppColors.white,
              height: 20.h,
              thickness: 1,
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('totalcost'.tr,
                      style: AppStyles.h4.copyWith(
                          fontSize: 24.sp,
                          color: AppColors.focus,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  //${controller.total}
                  child: Obx(() => Text('${controller.total} VND',
                      style: AppStyles.h4
                          .copyWith(fontSize: 20.sp, color: AppColors.white))),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 170.w,
                  height: 50.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
                      onTap: () {
                        debugPrint('order');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'orderf&b'.tr,
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
                SizedBox(
                  width: 170.w,
                  height: 50.h,
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
            ),
          )
        ],
      ),
    );
  }
}

class CartService extends StatelessWidget {
  final CartController controller;
  final ServiceContent serviceContent;
  final int quantity;
  final int index;
  const CartService(
      {super.key,
      required this.controller,
      required this.serviceContent,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    double price = serviceContent.price!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.r),
          child: InkWell(
            onTap: () {
              DialogCart().showCustomeDialog(context, serviceContent, quantity);
            },
            autofocus: index == 0 ? true : false,
            borderRadius: BorderRadius.circular(5.r),
            focusColor: AppColors.focus,
            child: Row(
              children: [
                //NAME
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 200.w,
                    child: Text(
                      serviceContent.name!,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: AppStyles.h5.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140.w,
                ),
                //PRICE
                SizedBox(
                  width: 92.w,
                  child: Text(
                    serviceContent.price.toString(),
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 115.w,
                ),
                //QUANTIY
                SizedBox(
                  width: 30.w,
                  child: Text(
                    quantity.toString(),
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 135.w,
                ),
                //TOTAL
                SizedBox(
                  width: 92.w,
                  child: Text(
                    "${price * quantity}",
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
