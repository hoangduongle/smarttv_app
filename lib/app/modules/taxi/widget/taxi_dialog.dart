import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/taxi/controller/taxi_controller.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';

class TaxiDialog extends StatelessWidget {
  const TaxiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showTaxiDialog(BuildContext context, int index,
      ServiceContent serviceContent, TaxiController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
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
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://i.ibb.co/7tYvdGh/duadonsanbay.jpg",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 150.h,
                                width: 180.w,
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
                      SizedBox(
                          // width: size.width.w,
                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${serviceContent.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "${serviceContent.description}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp,
                                  color: AppColors.greyColor),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      NumberUtils.vnd(serviceContent.price),
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
                                      "(${NumberUtils.vnd(serviceContent.price)} mỗi phòng)",
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
                          borderRadius: BorderRadius.circular(10.r),
                          child: InkWell(
                            autofocus: true,
                            focusColor: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              controller.orderService(serviceContent);
                            },
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

  void showSuccessDialog(BuildContext context) {
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
              Lottie.asset("assets/lotties/done.json", width: 100.w),
              Text(
                "Yêu cầu dịch vụ đưa đón đã được thông báo đến lễ tân",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Xin quý khách chờ trong giây lát lễ tân sẽ liên hệ",
                // textAlign: TextAlign.left,
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
            // caController.addService(serviceContent);
          ),
        ),
      ),
    );
  }

  void showTaxiExistDialog(
      BuildContext context, int index, ServiceContent serviceContent) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 2,
          backgroundColor: AppColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
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
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://i.ibb.co/7tYvdGh/duadonsanbay.jpg",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 150.h,
                                width: 180.w,
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
                      SizedBox(
                          // width: size.width.w,
                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${serviceContent.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: AppColors.white),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "Dịch vụ đã được đặt",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: AppColors.title),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      NumberUtils.vnd(serviceContent.price),
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
                                      "(${NumberUtils.vnd(serviceContent.price)} mỗi phòng)",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 40.h,
                        child: Material(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          child: InkWell(
                            autofocus: true,
                            focusColor: AppColors.greenFocus,
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quay lại'.tr,
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
