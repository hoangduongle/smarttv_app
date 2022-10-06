// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/service_components/widget/dialog.dart';

class CardEachService extends StatelessWidget {
  int index;
  CardEachService({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: AppColors.navigabackground,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          focusColor: AppColors.focus,
          // autofocus: true,
          borderRadius: BorderRadius.circular(15.r),
          onTap: () {
            DialogWidget(
              index: index,
            ).showCustomeDialog(context, 1);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.r),
                color: AppColors.navigabackground),
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQlO_2ts2YDGtpdafB8JDZzGVfyKlmFCn7paIJmTsKhfbev0I3O-OoMwgHJUDjSTc-KbjZge4_FgB2BUqVblVM',
                        height: 100,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            SkeletonLoading(Size(157, 300)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Name $index", //<------ set controller

                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Divider(
                    indent: 40,
                    endIndent: 40,
                    thickness: .5,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("100.000 VND", //<------ set controller
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.title)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
