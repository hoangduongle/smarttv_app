// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/alarm/controller/alarm_controller.dart';
import 'package:smarttv_app/app/modules/alarm/widget/dialog.dart';

class AlarmBuilder extends StatelessWidget {
  int index;
  AlarmContent alarmContent;

  AlarmBuilder({
    Key? key,
    required this.index,
    required this.alarmContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> time = alarmContent.dateTime!.split(" ");
    int hours = int.parse(time[1].substring(0, 2));
    int minutes = int.parse(time[1].substring(3, 5));
    return GetBuilder<AlarmController>(
      builder: (controller) {
        return Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          child: InkWell(
            onTap: () {
              const AlarmDialogWidget().showAlarmEditDialog(context, controller,
                  index, controller.alarmed[index], hours, minutes);
            },
            focusColor: AppColors.title,
            borderRadius: BorderRadius.circular(10.r),
            child: _container(time),
          ),
        );
      },
    );
  }

  Container _container(List<String> time) {
    return Container(
      padding: EdgeInsets.all(15.r),
      margin: EdgeInsets.all(2.r),
      width: 100.w,
      height: 110.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _row(time),
    );
  }

  Row _row(List<String> time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textTime(time),
            _sizeboxHeight(),
            _textTitle(),
          ],
        ),
        Icon(
          alarmContent.status! ? Icons.alarm_on : Icons.alarm_off,
          size: 35.sp,
          color: AppColors.orangeColor,
        ),
        Icon(
          Icons.edit,
          size: 25.sp,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  Text _textTime(List<String> time) {
    return Text(
      time[1].substring(0, 5), //dateTime.hour.toString()
      style: TextStyle(
        color: AppColors.title,
        fontWeight: FontWeight.bold,
        fontSize: 35.sp,
      ),
    );
  }

  Text _textTitle() {
    return Text(
      "Báo thức",
      style: TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
      ),
    );
  }

  SizedBox _sizeboxHeight() {
    return SizedBox(
      height: 5.h,
    );
  }
}
