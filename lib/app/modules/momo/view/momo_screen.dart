// ignore_for_file: non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, unused_element, await_only_futures
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/momo/controller/momo_controller.dart';

class MomoScreen extends GetView<MomoController> {
  const MomoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Future<void> MomoDialog(BuildContext context, int orderId) async {
    // if (controller.momo.value!.payUrl!.isNotEmpty) {
    //   controller.momo = Rx<MomoContent?>(null);
    // }
    // controller.fetchPaymentMomo(orderId);
    controller.createOrder(orderId);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
            width: 350.w,
            height: 330.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  width: 800.w,
                  child: Text(
                    "Quét mã để thanh toán",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.pink.withOpacity(.85),
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 190.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.r),
                                        bottomRight: Radius.circular(10.r))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () {
                          return controller.momo.value == null
                              ? Container(
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: AppColors.background,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Lottie.asset(
                                      "assets/lotties/loading.json"))
                              : Align(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.r),
                                    child: QrImage(
                                      backgroundColor: AppColors.white,
                                      foregroundColor: AppColors.black,
                                      data:
                                          "${controller.momo.value?.payUrl}", //
                                      version: QrVersions.auto,
                                      size: 180.0,
                                    ),
                                  ),
                                );
                        },
                      )
                    ],
                  ),
                ),
                // Obx(
                //   () => SizedBox(
                //     height: 35.h,
                //     child: Text(
                //       "Đơn hàng sẽ hết hạn sau ${NumberUtils.time(controller.minutes.toInt())}:${NumberUtils.time(controller.seconds.toInt())}",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontSize: 17.sp,
                //           fontWeight: FontWeight.normal,
                //           color: AppColors.orangeColor),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: Material(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.r),
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
            ),
          ),
        );
      },
    );
  }

  void showThanksDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 460.w,
              height: 290.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Lottie.asset("assets/lotties/done.json", width: 130),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Giao dịch thành công",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Cám ơn quý khách đã sử dụng dịch vụ của chúng tôi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 120.w,
                    child: Material(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
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
