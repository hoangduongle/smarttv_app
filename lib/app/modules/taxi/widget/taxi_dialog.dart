import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class TaxiDialog extends StatelessWidget {
  const TaxiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showTaxiDialog(BuildContext context, int index) {
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
              width: 650.w,
              height: 260.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 30.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 135.h,
                                width: 180.w,
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
                      ),
                      SizedBox(
                          // width: size.width.w,
                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Đưa đón sân bay (Tối đa 4 hành khách)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: AppColors.white),
                            ),
                            Text(
                              "1 chiều từ khách sạn đến sân bay",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp,
                                  color: AppColors.greyColor),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${NumberUtils.vnd(500000)}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: AppColors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "(${NumberUtils.vnd(500000)} mỗi phòng)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10.sp,
                                          color: AppColors.greyColor),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      NavigatorBack(),
                      SizedBox(
                        width: 200.w,
                      ),
                      SizedBox(
                        width: 150.w,
                        height: 40.h,
                        child: Material(
                          color: AppColors.focus,
                          borderRadius: BorderRadius.circular(5.r),
                          child: InkWell(
                            autofocus: true,
                            focusColor: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(5.r),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Đặt dịch vụ'.tr,
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
              )),
        );
      },
    );
  }
}
