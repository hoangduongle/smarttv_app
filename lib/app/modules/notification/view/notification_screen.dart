// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        ScrollController scrollNoticontroller = ScrollController();
        MainController maController = Get.find();
        return Dialog(
          elevation: 10,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
              width: 1000.w,
              height: 450.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    child: Text(
                      "Thông báo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orangeColor),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 800.w,
                    height: 350.h,
                    child: RawScrollbar(
                      thumbColor: AppColors.greyColor,
                      thumbVisibility: true,
                      radius: Radius.circular(100.r),
                      thickness: 10,
                      controller: scrollNoticontroller,
                      child: ListView.separated(
                        controller: scrollNoticontroller,
                        itemCount: maController.messages.value.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          return BuildMessage(
                            index: index,
                            messageContent: maController.messages.value[index],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NavigatorBack(
                    autoFocus: true,
                  ),
                ],
              )),
        );
      },
    );
  }

  void openDetailNoti(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        ScrollController scrollNoticontroller = ScrollController();
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
              width: 450.w,
              height: 300.h,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Thông tin chi tiết",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  Material(
                    color: AppColors.greyColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      margin: EdgeInsets.all(1.r),
                      width: 350.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Text(
                        "Đây là message content chi tiết",
                        style:
                            TextStyle(color: AppColors.white, fontSize: 20.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  NavigatorBack(
                    autoFocus: true,
                  ),
                ],
              )),
        );
      },
    );
  }
}

class BuildMessage extends StatelessWidget {
  int index;
  MessageContent messageContent;
  BuildMessage({
    Key? key,
    required this.index,
    required this.messageContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Material(
        color: AppColors.greyColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          focusColor: AppColors.orangeColor,
          borderRadius: BorderRadius.circular(10.r),
          onTap: () {
            const NotificationScreen().openDetailNoti(context);
          },
          autofocus: index == 0,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.all(1.r),
            decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10.r)),
            child: SizedBox(
              width: 750.w,
              child: Text(
                messageContent.messageContent.toString(),
                maxLines: 1,
                style: TextStyle(color: AppColors.white, fontSize: 20.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
