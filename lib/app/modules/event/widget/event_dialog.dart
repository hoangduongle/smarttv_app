import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class EventDialog extends StatelessWidget {
  const EventDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showEventDialog(
      BuildContext context, int index, EventContent eventContent) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          child: SizedBox(
              width: 690.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: CachedNetworkImage(
                      imageUrl: "https://i.ibb.co/ssdbk86/event1.png",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 150.h,
                          width: 480.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    width: 550.w,
                    child: Text(
                      eventContent.name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orangeColor.withOpacity(.8)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.calendar_ltr_12_regular,
                          color: AppColors.greyColor,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "${eventContent.startDate} - ${eventContent.endDate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.clock_12_regular,
                          color: AppColors.greyColor,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "${eventContent.startTime} - ${eventContent.endTime}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    width: double.infinity.w,
                    child: Text(
                      "Thông tin vé",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  Divider(
                    indent: 100.w,
                    endIndent: 150.w,
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    width: double.infinity.w,
                    height: 35.h,
                    child: Text(
                      "${eventContent.ticketInformation}",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    width: double.infinity.w,
                    child: Text(
                      "Mô tả sự kiện",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  Divider(
                    indent: 100.w,
                    endIndent: 150.w,
                    thickness: 1,
                    color: AppColors.greyColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    width: double.infinity.w,
                    height: 70.h,
                    child: Text(
                      "${eventContent.description}",
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 120.w,
                    child: Material(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(5.r),
                      child: InkWell(
                        autofocus: true,
                        borderRadius: BorderRadius.circular(5.r),
                        focusColor: AppColors.greenFocus,
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20.r,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'back'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: AppColors.black),
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
}
