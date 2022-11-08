// ignore_for_file: unused_field, unused_local_variable
import 'dart:async';
import 'dart:isolate';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class AlarmController extends BaseController {
  var hours = 0.obs;
  var minutes = 0.obs;
  int idAlarm = 0;

  late Timer _timer;
  List<AlarmContent> alarmed = [];

  @override
  void onInit() async {
    timing();
    await AndroidAlarmManager.initialize();
    super.onInit();
  }

  void timing() async {
    _timer = Timer.periodic(
      const Duration(milliseconds: 600),
      (timer) {
        changeUpdate();
      },
    );
  }

  void alarmOff() {
    FlutterRingtonePlayer.stop();
  }

  void changeUpdate() {
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

    if (alarmed.isNotEmpty) {
      for (var e in alarmed) {
        if (("${e.date}") == formattedDate) {
          FlutterRingtonePlayer.play(
            fromAsset: "assets/audios/alarm.mp3",
            volume: 10,
          );
          dialogWhenFired();
          e.status = false;
          update();
        }
      }
    }
  }

  void dialogWhenFired() {
    Get.dialog(
      Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SizedBox(
            width: 150.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/lotties/alarm.json", width: 100),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 100.w,
                  height: 30.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(5.r),
                    child: InkWell(
                      autofocus: true,
                      focusColor: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(5.r),
                      onTap: () {
                        alarmOff();
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tắt báo thức'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateAlarm(int hours, int minutes, int alarmId) async {
    DateTime currentDateTime = DateTime.now();
    DateTime timeAlarm = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      currentDateTime.day,
      hours,
      minutes,
    );
    if (currentDateTime.isAfter(timeAlarm)) {
      timeAlarm = DateTime(
        currentDateTime.year,
        currentDateTime.month,
        currentDateTime.day + 1,
        hours,
        minutes,
      );
    }
    AndroidAlarmManager.oneShotAt(
        DateTime(currentDateTime.year, currentDateTime.month,
            currentDateTime.day, hours, minutes),
        alarmId,
        firedAlarm,
        wakeup: true,
        exact: true);

    for (var element in alarmed) {
      if (element.id == alarmId) {
        element.status = true;
        element.date =
            "${NumberUtils.time(timeAlarm.day)}/${NumberUtils.time(timeAlarm.month)}/${timeAlarm.year} ${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}:00";
      }
    }
    update();
  }

  void setalarm(int hours, int minutes) async {
    DateTime currentDateTime = DateTime.now();
    idAlarm += 1;

    DateTime timeAlarm = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      currentDateTime.day,
      hours,
      minutes,
    );

    if (currentDateTime.isAfter(timeAlarm)) {
      timeAlarm = DateTime(
        currentDateTime.year,
        currentDateTime.month,
        currentDateTime.day + 1,
        hours,
        minutes,
      );
    }
    AndroidAlarmManager.oneShotAt(
      DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day,
          hours, minutes),
      idAlarm,
      firedAlarm,
      wakeup: true,
      exact: true,
      rescheduleOnReboot: true,
    );

    alarmed.add(AlarmContent(
      id: idAlarm,
      date:
          "${NumberUtils.time(timeAlarm.day)}/${NumberUtils.time(timeAlarm.month)}/${timeAlarm.year} ${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}:00",
      status: true,
    ));
  }

  static firedAlarm() {
    debugPrint("On Time Fired");
  }

  void removeAlarm(int id) {
    alarmed.removeWhere((element) => element.id == id);
  }

  void openDialog() {
    Get.dialog(Dialog(
      elevation: 2,
      backgroundColor: AppColors.navigabackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        width: 150.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lotties/alarm.json", width: 100),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(10.r),
                child: InkWell(
                  autofocus: true,
                  focusColor: AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tắt báo thức'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    ));
  }

  void incrementHours() {
    hours++;
  }

  void decrementHours() {
    hours--;
  }

  void incrementMinute() {
    minutes++;
  }

  void decrementMinute() {
    minutes--;
  }
}
