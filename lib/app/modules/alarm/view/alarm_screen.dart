// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, unnecessary_string_interpolations
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/alarm/controller/alarm_controller.dart';
import 'package:smarttv_app/app/modules/alarm/widget/alarm_builder.dart';
import 'package:smarttv_app/app/modules/alarm/widget/dialog.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

const List<Widget> alarms = <Widget>[Text('Bật'), Text('Tắt')];

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final List<bool> _selectedAlarm = <bool>[false, true];
  @override
  Widget build(BuildContext context) {
    ScrollController scrollControllerAlarm = ScrollController();
    return GetBuilder<AlarmController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(children: [
            TitleScreen(
              name: "Báo thức",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _sizeboxClockPainter(controller),
                          SizedBox(
                            width: 300.w,
                            height: 40.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      splashRadius: 12,
                                      color: AppColors.focus,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.hours <= 0) {
                                            controller.hours = 24.obs;
                                          }
                                          controller.decrementHours();
                                        });
                                      },
                                      icon: const Icon(Icons.remove_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                _containerShowtime(controller.hours.toInt()),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      autofocus: true,
                                      color: AppColors.title,
                                      splashRadius: 12,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.hours >= 23) {
                                            controller.hours = (-1).obs;
                                          }
                                          controller.incrementHours();
                                        });
                                      },
                                      icon: const Icon(Icons.add_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                _paddingText(),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      splashRadius: 12,
                                      color: AppColors.focus,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.minutes <= 0) {
                                            controller.minutes = 60.obs;
                                          }
                                          controller.decrementMinute();
                                        });
                                      },
                                      icon: const Icon(Icons.remove_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                                _containerShowtime(controller.minutes.toInt()),
                                Material(
                                  color: AppColors.transparent,
                                  child: IconButton(
                                      autofocus: true,
                                      color: AppColors.title,
                                      splashRadius: 12,
                                      onPressed: () {
                                        setState(() {
                                          if (controller.minutes >= 59) {
                                            controller.minutes = (-1).obs;
                                          }
                                          controller.incrementMinute();
                                        });
                                      },
                                      icon: const Icon(Icons.add_circle),
                                      focusColor: AppColors.orangeColor),
                                ),
                              ],
                            ),
                          ),
                          _sizeboxHeight(),
                          ToggleButtons(
                            children: alarms,
                            isSelected: _selectedAlarm,
                            fillColor: AppColors.transparent,
                            focusColor: AppColors.title,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18.sp),
                            selectedBorderColor: AppColors.orangeColor,
                            selectedColor: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.greyColor,
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0;
                                    i < _selectedAlarm.length;
                                    i++) {
                                  _selectedAlarm[i] = i == index;
                                }
                              });
                            },
                          ),
                          _sizeboxHeight(),
                          _sizeboxButton(context, _selectedAlarm, controller),
                        ],
                      )),
                  controller.alarmed.isEmpty
                      ? Container()
                      : _expandedListAlarm(scrollControllerAlarm, controller),
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}

Container _containerShowtime(int time) {
  return Container(
    color: AppColors.white,
    alignment: Alignment.center,
    width: 40.w,
    height: 30.h,
    child: Text("${NumberUtils.time(time)}",
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.black,
            fontWeight: FontWeight.bold)),
  );
}

SizedBox _sizeboxButton(BuildContext context, List<bool> selectedAlarm,
    AlarmController controller) {
  return SizedBox(
    width: 170.w,
    height: 50.h,
    child: Material(
      color: AppColors.focus,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        focusColor: AppColors.orangeColor,
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {
          if (selectedAlarm[0]) {
            controller.setalarm(
                controller.hours.toInt(), controller.minutes.toInt());
          } else {
            controller.alarmOffSound();
            AlarmDialogWidget().showAlarmOffDialog(context);
          }
        },
        child: _rowText(),
      ),
    ),
  );
}

Row _rowText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Đặt báo thức',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: AppColors.black),
      ),
    ],
  );
}

Expanded _expandedListAlarm(
    ScrollController scrollControllerAlarm, AlarmController controller) {
  return Expanded(
      child: SizedBox(
    height: 470.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          width: 300.w,
          height: 470.h,
          child: RawScrollbar(
            controller: scrollControllerAlarm,
            thumbColor: AppColors.title,
            thumbVisibility: true,
            radius: Radius.circular(100.r),
            thickness: 6,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: ListView.separated(
                controller: scrollControllerAlarm,
                itemCount: controller.alarmed.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemBuilder: (context, index) {
                  return AlarmBuilder(
                      index: index, alarmContent: controller.alarmed[0]);
                },
              ),
            ),
          ),
        )
      ],
    ),
  ));
}

SizedBox _sizeboxHeight() {
  return SizedBox(
    height: 20.h,
  );
}

Padding _paddingText() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: Text(
      ":",
      style: TextStyle(color: AppColors.white, fontSize: 30.sp),
    ),
  );
}

SizedBox _sizeboxClockPainter(AlarmController controller) {
  return SizedBox(
    width: 250.w,
    height: 250.h,
    child: CustomPaint(
      painter: ClockPainter(
          dateTime: DateTime(
        0,
        0,
        0,
        controller.hours.toInt(),
        controller.minutes.toInt(),
      )),
    ),
  );
}

class ClockPainter extends CustomPainter {
  DateTime dateTime;
  ClockPainter({
    required this.dateTime,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = AppColors.white.withOpacity(.9);

    var centerFillBrush = Paint()..color = AppColors.black;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [AppColors.black, AppColors.black])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.2;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [AppColors.black, AppColors.black])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.5;

    var dashBrush = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.4;

    canvas.drawCircle(center, radius - 40, fillBrush);

    var hourHandX = centerX +
        40 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        40 * -cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 55 * sin(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 55 * -cos(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    canvas.drawCircle(center, 6.5, centerFillBrush);

    var outerCircleRadius = 80;
    var innerCircleRadius = 65;
    for (double i = 0; i < 360; i += 90) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
