// ignore_for_file: unused_field, unused_local_variable
import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class AlarmController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  var hours = 0.obs;
  var minutes = 0.obs;
  int idAlarm = 0;
  late Timer _timer;
  List<AlarmContent> alarmed = [];
  AudioPlayer player = AudioPlayer();
  AudioCache musicCache = AudioCache();

  @override
  void onInit() async {
    timing();
    await AndroidAlarmManager.initialize();
    super.onInit();
  }

  Future<int> insertRoomAlarm(AlarmContent alarmContent) async {
    int result = -1;
    var overview = _repository.insertAlarm(alarmContent);
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    return result;
  }

  Future<int> deleteRoomAlarm(int id) async {
    int result = -1;
    var overview = _repository.deleteAlarm(id);
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    return result;
  }

  Future<int> updateRoomAlarm(AlarmContent alarmContent) async {
    int result = -1;
    var overview = _repository.updateAlarm(alarmContent);
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    return result;
  }

  // Stream<List<AbtractionContent>> abtractionStream() async* {
  //   while (true) {
  //     await Future.delayed(const Duration(hours: 9999999999));
  //     List<AbtractionContent> someProduct = await fetchAbtractions();
  //     yield someProduct;
  //   }
  // }

  void timing() async {
    _timer = Timer.periodic(
      const Duration(milliseconds: 600),
      (timer) {
        changeUpdate();
      },
    );
  }

  void changeUpdate() {
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
    if (alarmed.isNotEmpty) {
      for (var e in alarmed) {
        if (("${e.date}") == formattedDate) {
          audio();
          if (Get.isDialogOpen == false) {
            dialogWhenFired(e.date!.substring(11, 16));
          }
          e.status = false;
          update();
        }
      }
    }
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
    sort();
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

    sort();
    update();
  }

  void removeAlarm(int id) {
    // Future<int> result = deleteRoomAlarm(id);
    alarmed.removeWhere((element) => element.id == id);

    // if (result == 200) {
    //   debugPrint("Room Alarm: Delete Success id: $id");
    // } else {
    //   debugPrint("Room Alarm: Delete Fail id: $id");
    // }
  }

  void alarmOff() {
    player.stop();
  }

  void sort() {
    alarmed.sort(
      (a, b) => b.date!.compareTo(a.date!),
    );
  }

  void dialogWhenFired(String time) {
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
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
            width: 100.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset("assets/lotties/alarm.json", width: 80.w),
                SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp),
                  ),
                ),
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

  static firedAlarm() {
    // debugPrint("On Time Fired");
  }

  void audio() async {
    String audioasset = "assets/audios/alarm.mp3";
    Uint8List? audiobytes;
    ByteData bytes = await rootBundle.load(audioasset);
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    player.setVolume(10);

    if (player.state == PlayerState.PLAYING) {
      player.stop();
      musicCache = AudioCache(prefix: "assets/audios/");
      player = await musicCache.loop("alarm.mp3");
      // await player.playBytes(audiobytes);
    } else {
      musicCache = AudioCache(prefix: "assets/audios/");
      player = await musicCache.loop("alarm.mp3");
      // await player.playBytes(audiobytes);
    }
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
