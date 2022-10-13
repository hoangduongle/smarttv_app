import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

import 'package:smarttv_app/app/modules/alarm/controller/alarm_controller.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool isOn = false;
  int alarmId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GetBuilder<AlarmController>(
      init: AlarmController(),
      builder: (controller) {
        return ElevatedButton(onPressed: () {}, child: const Text("Push"));
      },
    )));
  }

  void firedAlarm() {
    Intl.defaultLocale = 'vi_VN';

    String formattedTime = DateFormat('hh:mm').format(DateTime.now());
    debugPrint("Fired Alarm at $formattedTime");
  }
}
