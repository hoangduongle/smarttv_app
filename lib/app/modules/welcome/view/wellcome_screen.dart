// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';
import 'package:smarttv_app/app/modules/welcome/widget/buildImagWelcome.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //========================================================
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audios/audio.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  Uint8List? audiobytes;
  AudioPlayer player = AudioPlayer();
  WellcomeController controller = Get.find();
  //========================================================

  void autoPlay() async {
    int result = await player.playBytes(audiobytes!);
    if (result == 1) {
      //play success
      setState(() {
        isplaying = true;
        audioplayed = true;
      });
    } else {
      debugPrint("Error while playing audio.");
    }
  }

  void notPlay() {}

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.setVolume(40);
      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel =
            "${rminutes.toString().padLeft(2, '0')}:${rseconds.toString().padLeft(2, '0')}";
        setState(() {});
      });
      if (controller.isbirthday) {
        autoPlay();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<WellcomeController>(
      builder: (controller) {
        return controller.url == ""
            ? Container(
                height: size.height.h,
                width: size.width.w,
                decoration: const BoxDecoration(
                  color: AppColors.color1414,
                  image: DecorationImage(
                      image: AssetImage(AppAssets.home_masterWelcome),
                      fit: BoxFit.cover,
                      opacity: 0.2),
                ),
              )
            : Scaffold(
                backgroundColor: AppColors.white,
                body: Container(
                    height: size.height.h,
                    width: size.width.w,
                    decoration: const BoxDecoration(
                      color: AppColors.color1414,
                      image: DecorationImage(
                          image: AssetImage(AppAssets.home_masterWelcome),
                          fit: BoxFit.cover,
                          opacity: 0.2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.formattedTime.toString(),
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.Arvo),
                                  ),
                                  Text(
                                    controller.formattedDate.toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.network(controller.url, height: 55),
                                  Text(
                                    "${controller.weatherCelsius!.toStringAsFixed(0)} \u2103",
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.Arvo),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.logoforeground, height: 40),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.h),
                            ),
                            Text(
                              AppConstants.title,
                              style: AppStyles.h1.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: (size.width * 1 / 35).sp),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35.h),
                          child: Text(
                            controller.isbirthday
                                ? 'Chúc mừng sinh nhật @name'
                                : 'Xin chào buổi chiều @name'.tr,
                            style: AppStyles.h4.copyWith(
                                color: AppColors.white,
                                fontSize: (size.width * 1 / 25).sp),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35.h),
                          child: Text(
                            'Chúc @name có một kỳ nghỉ tuyệt vời'.tr,
                            style: AppStyles.h4.copyWith(
                                color: AppColors.greyColor,
                                fontSize: (size.width * 1 / 45).sp),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          width: size.width.w,
                          height: 200.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 85.w),
                              itemBuilder: (context, index) {
                                return buildImageWelcome(
                                    size, index, context, player);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 40.w,
                                  ),
                              itemCount: 5),
                        )
                      ],
                    )),
              );
      },
    );
  }
}
