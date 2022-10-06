// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/local/controller/local_controller.dart';

class LocalScreen extends GetView<LocalController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: AppColors.background, body: Container());
  }
}
