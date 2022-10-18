// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildIndicator(List<OverviewContent> _list, int currentIndex) {
  return AnimatedSmoothIndicator(
    curve: Curves.easeInOut,
    activeIndex: currentIndex,
    count: _list.length,
    effect: const SlideEffect(
        spacing: 30,
        dotColor: AppColors.greyColor,
        activeDotColor: AppColors.focus),
  );
}
