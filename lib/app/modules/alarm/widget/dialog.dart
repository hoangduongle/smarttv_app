// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/modules/alarm/controller/alarm_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class AlarmDialogWidget extends StatelessWidget {
  const AlarmDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showAlarmOnDialog(BuildContext context, int hours, int minutes) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: SizedBox(
          width: 500.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.done, width: 100.w),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: AppColors.white, fontSize: 15.sp),
                  children: <TextSpan>[
                    TextSpan(text: "Báo thức sẽ được thực hiện vào lúc "),
                    TextSpan(
                        text:
                            "${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.orangeColor)),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Cám ơn quý khách đã sử dụng dịch vụ của chúng tôi",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(10.r),
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
                              fontSize: 15.sp,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlarmOffDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: SizedBox(
          width: 500.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.loadingDongHo, width: 100.w),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                  children: <TextSpan>[
                    TextSpan(text: "Báo thức hiện chưa được thực hiện "),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Xin hãy chọn chế độ bật báo thức",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(10.r),
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
                              fontSize: 15.sp,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlarmEditDialog(BuildContext context, AlarmController controller,
      int index, AlarmContent alarmContent, int hours, int minutes) {
    var hcount = hours.obs;
    var mcount = minutes.obs;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: SizedBox(
          width: 300.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Chỉnh sửa báo thức",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 5.h,
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
                          if (hcount != 0) {
                            hcount--;
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 20.sp,
                        ),
                        focusColor: AppColors.orangeColor),
                  ),
                  Obx(
                    () => Container(
                      color: AppColors.white,
                      alignment: Alignment.center,
                      width: 35.w,
                      height: 25.h,
                      child: Text(NumberUtils.time(hcount.toInt()),
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: IconButton(
                        color: AppColors.title,
                        splashRadius: 12,
                        onPressed: () {
                          if (hcount != 23) {
                            hcount++;
                          }
                        },
                        icon: Icon(Icons.add_circle, size: 20.sp),
                        focusColor: AppColors.orangeColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      ":",
                      style: TextStyle(color: AppColors.white, fontSize: 15.sp),
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: IconButton(
                        splashRadius: 12,
                        color: AppColors.focus,
                        onPressed: () {
                          if (mcount != 00) {
                            mcount--;
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 20.sp,
                        ),
                        focusColor: AppColors.orangeColor),
                  ),
                  Obx(
                    () => Container(
                      color: AppColors.white,
                      alignment: Alignment.center,
                      width: 35.w,
                      height: 25.h,
                      child: Text(NumberUtils.time(mcount.toInt()),
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: IconButton(
                        color: AppColors.title,
                        splashRadius: 12,
                        onPressed: () {
                          if (mcount != 59) {
                            mcount++;
                          }
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 20.sp,
                        ),
                        focusColor: AppColors.orangeColor),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
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
                        autofocus: true,
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
                                  fontSize: 17.sp,
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
                          controller.updateAlarm(hcount.toInt(), mcount.toInt(),
                              alarmContent.id!.toInt());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lưu",
                              style: TextStyle(
                                  fontSize: 17.sp,
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
                height: 20.h,
              ),
              SizedBox(
                width: 110.w,
                height: 30.h,
                child: Material(
                  color: AppColors.red.withOpacity(.7),
                  borderRadius: BorderRadius.circular(5.r),
                  elevation: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    focusColor: AppColors.red,
                    onTap: () {
                      controller.removeAlarm(alarmContent.id ?? 0);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Xoá báo thức",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
