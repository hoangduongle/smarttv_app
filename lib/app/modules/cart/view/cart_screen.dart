// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/cart/widget/dialog.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController scrollControllerCart = ScrollController();
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
          _sizeboxHeight(38),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    _sizeboxWidth(80),
                    Text(
                      'STT.',
                      style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title),
                    ),
                    _sizeboxWidth(30),
                    Text(
                      'namefood'.tr,
                      style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title),
                    ),
                    _sizeboxWidth(200),
                    Text('unitprice'.tr,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.title)),
                    _sizeboxWidth(110),
                    Text('quantity'.tr,
                        style: AppStyles.h4.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.title)),
                    _sizeboxWidth(100),
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
              child: RawScrollbar(
                controller: scrollControllerCart,
                thumbColor: AppColors.title,
                thumbVisibility: true,
                radius: Radius.circular(100.r),
                thickness: 10,
                child: ListView.separated(
                    controller: scrollControllerCart,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.services.length,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                    itemBuilder: (context, index) => CartService(
                        controller: controller,
                        serviceContent:
                            controller.services.keys.toList()[index],
                        quantity: controller.services.values.toList()[index],
                        index: index)),
              ),
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
          _sizeboxHeight(10),
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
          _sizeboxHeight(5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(() => Text(NumberUtils.vnd(controller.total),
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
                        controller.addNewOrder();
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

  SizedBox _sizeboxHeight(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  SizedBox _sizeboxWidth(double width) {
    return SizedBox(
      width: width.w,
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
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          child: InkWell(
            onTap: () {
              DialogCart().showCartDialog(context, serviceContent, quantity);
            },
            autofocus: index == 0 ? true : false,
            borderRadius: BorderRadius.circular(10.r),
            focusColor: AppColors.focus,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SizedBox(
                    width: 30.w,
                    child: Text(
                      (index + 1).toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: AppStyles.h5.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _sizeboxWidth(40),
                //NAME
                SizedBox(
                  width: 200.w,
                  child: Text(
                    serviceContent.name!,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                _sizeboxWidth(65),
                //PRICE
                SizedBox(
                  width: 92.w,
                  child: Text(
                    NumberUtils.noVnd(serviceContent.price),
                    textAlign: TextAlign.center,
                    style: AppStyles.h5.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                _sizeboxWidth(120),
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
                  width: 25.w,
                  child: Icon(
                    Icons.edit,
                    color: AppColors.background,
                  ),
                ),
                _sizeboxWidth(105),
                //TOTAL
                SizedBox(
                  width: 92.w,
                  child: Text(
                    NumberUtils.noVnd(price * quantity),
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

  SizedBox _sizeboxWidth(double width) {
    return SizedBox(
      width: width.w,
    );
  }
}
