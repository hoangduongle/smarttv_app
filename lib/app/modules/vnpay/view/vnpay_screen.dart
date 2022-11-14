import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class VNPayScreen extends StatelessWidget {
  const VNPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> VNPayDialog(BuildContext context) async {
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
            width: 380.w,
            height: 400.h,
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
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 120.h,
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
                      // Obx(
                      //   () {
                      //     return controller.momo.value == null
                      //         ? Container(
                      //             width: 300,
                      //             height: 200,
                      //             decoration: BoxDecoration(
                      //                 color: AppColors.background,
                      //                 borderRadius: BorderRadius.circular(8.r)),
                      //             child: Lottie.asset(
                      //                 "assets/lotties/loading.json"))
                      //         : Align(
                      //             child: Padding(
                      //               padding: EdgeInsets.all(10.r),
                      //               child: QrImage(
                      //                 backgroundColor: AppColors.white,
                      //                 foregroundColor: AppColors.black,
                      //                 data: "${controller.momo.value?.payUrl}",
                      //                 version: QrVersions.auto,
                      //                 size: 190.0,
                      //               ),
                      //             ),
                      //           );
                      //   },
                      // )
                    ],
                  ),
                ),
                Obx(
                  () => SizedBox(
                    height: 35.h,
                    child: Text(
                      "Đơn hàng sẽ hết hạn sau ",
                      //${NumberUtils.time(controller.minutes.toInt())}:${NumberUtils.time(controller.seconds.toInt())}
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.orangeColor),
                    ),
                  ),
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
            ),
          ),
        );
      },
    );
  }
}
