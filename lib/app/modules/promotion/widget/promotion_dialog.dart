import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/model/promotion_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class PromotionDialog extends StatelessWidget {
  const PromotionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showPromotionDialog(
      BuildContext context, int index, PromotionContent promotionContent) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        List<String> arrDescription =
            promotionContent.detailInformation!.split("+");
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              width: 800.w,
              height: 423.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 330.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${promotionContent.name}", //<------ set controller
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
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
                                  "${promotionContent.startDate} - ${promotionContent.endDate}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              "Thông tin mô tả",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.title),
                            ),
                            Container(
                              width: 360.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.greyColor, width: 1.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 360.w,
                              height: 52.h,
                              child: Text(
                                "${promotionContent.description}",
                                textAlign: TextAlign.left,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.greyColor),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Thông tin chi tiết",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.title),
                            ),
                            Container(
                              width: 360.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.greyColor, width: 1.w),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            for (var description in arrDescription)
                              if (description != '')
                                Padding(
                                  padding: EdgeInsets.only(top: 6.h),
                                  child: Text(
                                    "+ $description",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.greyColor),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  NavigatorBack(),
                ],
              )),
        );
      },
    );
  }
}
