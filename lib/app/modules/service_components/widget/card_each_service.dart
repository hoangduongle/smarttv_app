// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:smarttv_app/app/modules/service/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/service_components/widget/dialog.dart';
import 'package:smarttv_app/app/values/app_colors.dart';

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
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.navigabackground,
      child: InkWell(
        focusColor: AppColors.focus,
        autofocus: true,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          DialogWidget(
            index: index,
          ).showCustomeDialog(context);
        },
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 4),
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.pixelstalk.net/wp-content/uploads/2016/07/1080p-Full-HD-Images.jpg',
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
                    color: AppColors.white),
              ),
              SizedBox(
                height: 4,
              ),
              Divider(
                indent: 40,
                endIndent: 40,
                thickness: 1,
                color: AppColors.white,
              ),
              SizedBox(
                height: 4,
              ),
              Text("100.000 VND", //<------ set controller
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
