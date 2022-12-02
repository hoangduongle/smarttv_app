// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/turndown/controller/turndown_controller.dart';
import 'package:smarttv_app/app/widget/cached_image.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class TurndownScreen extends StatefulWidget {
  const TurndownScreen({super.key});

  @override
  State<TurndownScreen> createState() => _TurndownScreenState();
}

class _TurndownScreenState extends State<TurndownScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TurndownController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppColors.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleScreen(
                  name: "Dọn phòng nhanh",
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 25.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ImageNetwork(
                                      url:
                                          "https://i.ibb.co/pQdMLns/donphong.jpg",
                                      width: 300.w,
                                      height: 200.h),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thông tin",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.title),
                                        ),
                                        Container(
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: AppColors.title,
                                                  width: 1.w),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        SizedBox(
                                          width: 410.w,
                                          height: 120.h,
                                          child: Text(
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: AppColors.greyColor),
                                              "Nhằm đem đến cho quý khách trãi nghiệm thoãi mái nhất chúng tôi cung cấp dịch vụ dọn phòng nhanh (ngoài khung giờ dọn phòng định kỳ). Quý khách có thể chọn giờ trong khung giờ phục vụ của chúng tôi. Từ đó nhân viên sẽ tiến hành dọn phòng theo thời gian yêu cầu."),
                                        ),
                                        Text(
                                          "Giờ làm việc",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.title),
                                        ),
                                        Container(
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: AppColors.title,
                                                  width: 1.w),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "08:00 - 19:59",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.greyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Quý khách vui lòng chọn giờ phù hợp để dọn phòng bên dưới",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              width: 450.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.greyColor, width: 1.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      splashRadius: 12,
                                      color: AppColors.focus,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.countHours <=
                                              controller.startHours) {
                                            controller.countHours =
                                                (controller.endHours + 1).obs;
                                          }
                                          controller.decrementHours();
                                          if (controller.countHours ==
                                              controller.hours) {
                                            controller.countMinute =
                                                controller.minutes.obs;
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                Container(
                                    color: AppColors.white,
                                    alignment: Alignment.center,
                                    width: 40.w,
                                    height: 30.h,
                                    child: Obx(
                                      () => Text(
                                          NumberUtils.time(
                                              controller.countHours.toInt()),
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      autofocus: true,
                                      color: AppColors.title,
                                      splashRadius: 12,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.countHours >=
                                              controller.endHours) {
                                            controller.countHours =
                                                (controller.startHours - 1).obs;
                                          }
                                          controller.incrementHours();
                                        });
                                      },
                                      icon: const Icon(Icons.add_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 30.sp),
                                  ),
                                ),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      splashRadius: 12,
                                      color: AppColors.focus,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.countHours ==
                                              controller.hours) {
                                            controller.startMinutes =
                                                controller.minutes;
                                          } else if (controller.countHours !=
                                              controller.hours) {
                                            controller.startMinutes = 0;
                                          }
                                          if (controller.countMinute ==
                                              controller.startMinutes) {
                                            controller.countMinute =
                                                (controller.endMinutes + 1).obs;
                                          }
                                          controller.decrementMinute();
                                        });
                                      },
                                      icon: const Icon(Icons.remove_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                Container(
                                  color: AppColors.white,
                                  alignment: Alignment.center,
                                  width: 40.w,
                                  height: 30.h,
                                  child: Obx(
                                    () => Text(
                                        NumberUtils.time(
                                            controller.countMinute.toInt()),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      autofocus: true,
                                      color: AppColors.title,
                                      splashRadius: 12,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.countHours ==
                                              controller.hours) {
                                            controller.startMinutes =
                                                controller.minutes;
                                          } else if (controller.countHours !=
                                              controller.hours) {
                                            controller.startMinutes = 0;
                                          }
                                          if (controller.countMinute ==
                                              controller.endMinutes) {
                                            controller.countMinute =
                                                (controller.startMinutes - 1)
                                                    .obs;
                                          }
                                          controller.incrementMinute();
                                        });
                                      },
                                      icon: const Icon(Icons.add_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 170.w,
                              height: 50.h,
                              child: Material(
                                color: controller.isWork
                                    ? AppColors.focus
                                    : AppColors.greyColor,
                                borderRadius: BorderRadius.circular(10.r),
                                child: InkWell(
                                  focusColor: controller.isWork
                                      ? AppColors.orangeColor
                                      : AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  onTap: () {
                                    controller.isWork ? null : null;
                                    // controller.requestTurndown(
                                    //     controller.countHours.toInt(),
                                    //     controller.countMinute.toInt());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.isWork
                                            ? 'Đặt dịch vụ'.tr
                                            : 'Tạm đóng'.tr,
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
                        )))
              ],
            ),
          ),
        );
      },
    );
  }
}
