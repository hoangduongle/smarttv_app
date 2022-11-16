import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColors.background,
      ),
      child: Scaffold(
        body: Center(
          child: GetBuilder<SplashController>(
            builder: (controller) => SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller.videoPlayerController.value.size.width,
                  height: controller.videoPlayerController.value.size.height,
                  child: VideoPlayer(controller.videoPlayerController),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
