import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class PromotionDialog extends StatelessWidget {
  const PromotionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showPromotionDialog(
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
                              "${newsContent.images!.isEmpty ? "https://www.vuescript.com/wp-content/uploads/2018/11/Show-Loader-During-Image-Loading-vue-load-image.png" : newsContent.images![0].pictureUrl}",
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
                          placeholder: (context, url) {
                            return Container(
                              height: 330.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: const DecorationImage(
                                  image: AssetImage(AppAssets.loadImage),
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
                              "${newsContent.newName}", //<------ set controller
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
                                "${newsContent.description}",
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
                            SizedBox(
                              width: 360.w,
                              // height: 40.h,
                              child: Padding(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Text(
                                  "${newsContent.detailInformation}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
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
