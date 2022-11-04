// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget SkeletonLoading(Size size) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    period: Duration(milliseconds: 1500),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(110.r)),
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: size.width, //158 //178
              height: size.height, //300
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(110.r),
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}
