import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class EventDialog extends StatelessWidget {
  const EventDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showEventDialog(
      BuildContext context, int index, NewsContent newsContent) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
              width: 560.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${newsContent.image == null ? AppAssets.loadImageNetWork : newsContent.image!.pictureUrl}",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 200.h,
                          width: 400.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
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
                      newsContent.newName.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 78.w),
                    child: Row(
                      children: [
                        Row(
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
                              "${newsContent.startDate} - ${newsContent.endDate}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.greyColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 85.w,
                        ),
                        Row(
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
                              "${newsContent.startTime} - ${newsContent.endTime}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    width: 400.w,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.greyColor))),
                    child: Text(
                      "Thông tin vé",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 400.w,
                    height: 25.h,
                    child: Text(
                      "${newsContent.ticketInformation}",
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
                    width: 400.w,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.greyColor))),
                    child: Text(
                      "Mô tả sự kiện",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  SizedBox(
                    width: 400.w,
                    height: 70.h,
                    child: Text(
                      "${newsContent.description}",
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
