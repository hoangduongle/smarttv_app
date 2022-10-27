import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/promotion/controller/promotion_controller.dart';
import 'package:smarttv_app/app/modules/promotion/loading/promotion_loading.dart';
import 'package:smarttv_app/app/modules/promotion/widget/build_promotion.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class PromotionScreen extends GetView<PromotionController> {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleScreen(name: "promotion".tr,),
                controller.promotionList.value.isEmpty
                    ? PromotionLoading()
                    : Expanded(
                        child: SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: naController.select ? 40.w : 40.w,
                              vertical: 0.h),
                          child: GridView.builder(
                            itemCount: controller.promotionList.value.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: naController.select ? 2 : 3,
                              crossAxisSpacing:
                                  naController.select ? 40.w : 40.w,
                              mainAxisExtent: 300,
                              mainAxisSpacing: 30.h,
                            ),
                            itemBuilder: (context, index) {
                              return BuildPromotion(
                                index: index,
                                promotionContent:
                                    controller.promotionList.value[index],
                              );
                            },
                          ),
                        ),
                      )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
