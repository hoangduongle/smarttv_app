// ignore_for_file: unused_field, unused_local_variable, await_only_futures
import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/alarm/widget/dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class AlarmController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  var hours = 0.obs;
  var minutes = 0.obs;
  late Timer _timer;
  late Timer _getTimer;
  List<AlarmContent> alarmed = [];
  Rx<List<AlarmContent>> alarms = Rx<List<AlarmContent>>([]);

  AudioPlayer player = AudioPlayer();
  AudioCache musicCache = AudioCache();

  @override
  void onInit() async {
    timing();
    timingGetAlarm();
    getListRoomAlarm();
    await AndroidAlarmManager.initialize();
    super.onInit();
  }

  Future<void> getListRoomAlarm() async {
    AlarmContent result = AlarmContent();
    var overview = _repository.getListAlarm();
    await callDataService(
      overview,
      onSuccess: (List<AlarmContent> response) {
        alarms(response);
      },
      onError: ((dioError) {}),
    );
    // if (alarmed.isNotEmpty) {
    //   alarmed.clear();
    // }
    alarmed = alarms.value;
    // debugPrint("Alarm Value${alarms.value.toString()}");
  }

  Future<AlarmContent> insertRoomAlarm(AlarmContent alarmContent) async {
    AlarmContent result = AlarmContent();
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

  void timing() async {
    _timer = Timer.periodic(
      const Duration(milliseconds: 600),
      (timer) {
        changeUpdate();
      },
    );
  }

  void timingGetAlarm() async {
    _getTimer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) async {
        await getListRoomAlarm();
      },
    );
  }

  void changeUpdate() {
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
    if (alarmed.isNotEmpty) {
      for (var e in alarmed) {
        if (("${e.dateTime}") == formattedDate) {
          audio();
          if (Get.isDialogOpen == false) {
            e.status = false;
            dialogWhenFired(e.dateTime!.substring(11, 16), e);
          }
          update();
        }
      }
    }
  }

  void updateAlarm(int hours, int minutes, int alarmId) async {
    Get.back();
    const LoadingDialog().showLoadingDialog(Get.context!);
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
        element.dateTime =
            "${NumberUtils.time(timeAlarm.day)}/${NumberUtils.time(timeAlarm.month)}/${timeAlarm.year} ${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}:00";
        int result = await updateRoomAlarm(element);
        if (result == 200) {
          debugPrint("Update Alarm Success!");
        } else {
          debugPrint("Update Alarm Fail!");
        }
      }
    }
    sort();
    Get.back();
    const AlarmDialogWidget()
        .showAlarmOnDialog(Get.context!, hours.toInt(), minutes.toInt());
    update();
  }

  void setalarm(int hours, int minutes) async {
    const LoadingDialog().showLoadingDialog(Get.context!);
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
    final prefs = await SharedPreferences.getInstance();
    int? bookingId = await prefs.getInt("bookingId");
    AlarmContent newAlarm = await insertRoomAlarm(AlarmContent(
        id: 0,
        dateTime:
            "${NumberUtils.time(timeAlarm.day)}/${NumberUtils.time(timeAlarm.month)}/${timeAlarm.year} ${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}:00",
        status: true,
        bookingId: bookingId));
    AndroidAlarmManager.oneShotAt(
      DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day,
          hours, minutes),
      newAlarm.id!,
      firedAlarm,
      wakeup: true,
      exact: true,
      rescheduleOnReboot: true,
    );
    alarmed.add(newAlarm);
    sort();
    Get.back();
    const AlarmDialogWidget()
        .showAlarmOnDialog(Get.context!, hours.toInt(), minutes.toInt());
    update();
  }

  void removeAlarm(int id) async {
    Get.back();
    const LoadingDialog().showLoadingDialog(Get.context!);
    int result = await deleteRoomAlarm(id);
    if (result == 200) {
      alarmed.removeWhere((element) => element.id == id);
      debugPrint("Room Alarm: Delete Success id: $id");
    } else {
      debugPrint("Room Alarm: Delete Fail id: $id");
    }

    Get.back();
  }

  void alarmOff(AlarmContent alarmContent) {
    player.stop();
    updateRoomAlarm(alarmContent);
  }

  void sort() {
    alarmed.sort(
      (a, b) => b.dateTime!.compareTo(a.dateTime!),
    );
  }

  void dialogWhenFired(String time, AlarmContent alarmContent) {
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
                        alarmOff(alarmContent);
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
