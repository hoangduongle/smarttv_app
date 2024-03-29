// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class ImageBuild extends StatelessWidget {
  OverviewContent overviewContent;
  int index;
  ImageBuild({
    Key? key,
    required this.overviewContent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.h),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          // onTap: () {},
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: overviewContent.imageUrl ??
                      AppAssets.loadImageNetWork, //urlLoadingImage
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 1000.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      width: 1000.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(AppAssets.loadImageNetWork),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r)),
                      color: AppColors.navigabackground.withOpacity(0.8.r),
                    ),
                    width: 1000,
                    height: 140,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overviewContent.title ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.title,
                                  fontSize: 25.sp,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 700.w,
                                height: 70.h,
                                child: Text(
                                  overviewContent.description ?? "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
   List<String> arrDescription = overviewContent.description!.split("+");
   return Container(
    padding: EdgeInsets.only(top: 8.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        imageUrl: overviewContent.imageUrl!,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: (size.height * 1 / 2).h,
            width: size.width.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
            child: 
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  height: (size.height * 1 / 4).h,
                  width: size.width.w,
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Text(
                          overviewContent.title!,
                          style: AppStyles.h4.copyWith(
                              color: AppColors.white,
                              fontSize: (size.height * 4 / 100).sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (var description in arrDescription)
                        if (description != '')
                          Padding(
                            padding: EdgeInsets.only(
                                left: 6.w, bottom: 6.h, top: 2.h),
                            child: Text(
                              ' + ${description}',
                              style: AppStyles.h4.copyWith(
                                  color: AppColors.white,
                                  fontSize: (size.height * 3 / 100).sp),
                            ),
                          )
                    ],
                  )),
            ]),
          );
        },
        placeholder: (context, url) {
          return Container();
        },
      ),
    ),
  );
 * 
 */