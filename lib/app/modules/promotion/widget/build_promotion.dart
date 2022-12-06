// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/promotion/widget/promotion_dialog.dart';

class BuildPromotion extends StatelessWidget {
  int index;
  NewsContent newsContent;
  BuildPromotion({
    Key? key,
    required this.index,
    required this.newsContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        focusColor: AppColors.title,
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {
          const PromotionDialog()
              .showPromotionDialog(context, index, newsContent);
        },
        child: Container(
            margin: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${newsContent.image == null ? AppAssets.loadImageNetWork : newsContent.image!.pictureUrl}",
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: naController.select ? 200.h : 160.h,
                          width: size.width.w,
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
                          height: naController.select ? 200.h : 160.h,
                          width: size.width.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: const DecorationImage(
                              image: NetworkImage(AppAssets.loadImageNetWork),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "${newsContent.newName}", //<------ set controller
                    style: TextStyle(
                        fontSize: naController.select ? 20.sp : 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "${newsContent.description}",
                    maxLines: naController.select ? 2 : 5,
                    style: TextStyle(
                        fontSize: naController.select ? 15.sp : 13.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyColor),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
