// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/bill/controller/bill_controller.dart';
import 'package:smarttv_app/app/modules/bill/widget/bill_dialog.dart';
import 'package:smarttv_app/app/modules/bill/widget/listbill.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class BillScreen extends GetView<BillController> {
  const BillScreen({super.key});

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
            Container(
              padding: EdgeInsets.only(top: 25.h, left: 30.w),
              child: Row(
                children: [
                  Text("Mã Hoá Đơn: ",
                      style: AppStyles.h4.copyWith(
                          color: AppColors.header,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "#${controller.bill.value?.id ?? '00000'}", //${controller.bill.value?.id}
                      style: AppStyles.h4.copyWith(
                          color: AppColors.header,
                          fontSize: (size.width * 0.02).sp))
                ],
              ),
            ),
            const Divider(
              color: AppColors.greyColor,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'service'.tr,
                      style: AppStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.title,
                      ),
                    ),
                    Text('quantity'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('unitprice'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('totalamout'.tr,
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    Text('Ngày',
                        style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.title,
                        )),
                    naController.select
                        ? Container()
                        : Text('status'.tr,
                            style: AppStyles.h4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: AppColors.title,
                            )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: Divider(
                    color: AppColors.white,
                    height: 20.h,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  width: 870.w,
                  height: 185.h,
                  child: ListView.separated(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.billDetails.value.length,
                      separatorBuilder: (context, index) => SizedBox(
                            height: 25.h,
                          ),
                      itemBuilder: (context, index) => ListBill(
                            billDetailContent:
                                controller.billDetails.value[index],
                            billController: controller,
                            index: index,
                          )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Divider(
                    color: AppColors.white,
                    height: 20.h,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                                fontSize: 20.sp,
                                color: AppColors.title,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
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
                        child: Text(
                            NumberUtils.vnd(
                                controller.bill.value?.totalAmount ?? 0),
                            style: AppStyles.h4.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                ),
                SizedBox(
                  width: 170.w,
                  height: 50.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(5.r),
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(5.r),
                      onTap: () {
                        BillDialog().showBillDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'pay'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
