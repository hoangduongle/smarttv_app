import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class AbtractionDialog extends StatelessWidget {
  const AbtractionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showAbtractionDialog(
      BuildContext context, AbtractionContent abtractionContent) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 800.w,
              height: 450.h,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Địa điểm ăn uống",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  const Divider(
                    indent: 300,
                    endIndent: 300,
                    thickness: .5,
                    color: AppColors.white,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 25.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 250.h,
                                width: 300.w,
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${abtractionContent.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 400.w,
                              height: 140.h,
                              child: Text(
                                "${abtractionContent.description}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.sp,
                                    color: AppColors.greyColor),
                              ),
                            ),
                            Text(
                              "Giờ mở cửa: Hằng ngày ${abtractionContent.openTime} - ${abtractionContent.closeTime}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: 400.w,
                              child: Text(
                                "Vị trí: ${abtractionContent.address}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                    color: AppColors.greyColor),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mã QR vị trí",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.sp,
                                      color: AppColors.greyColor),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: QrImage(
                                    backgroundColor: AppColors.white,
                                    foregroundColor: AppColors.black,
                                    data:
                                        "https://www.google.com/maps/search/?api=1&query=${abtractionContent.latidute},${abtractionContent.logtitude}",
                                    version: QrVersions.auto,
                                    size: 110.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  NavigatorBack(
                    autoFocus: true,
                    background: AppColors.navigabackground,
                  ),
                ],
              )),
        );
      },
    );
  }
}
