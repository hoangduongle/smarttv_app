// ignore_for_file: implementation_imports, unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class Birthday extends StatefulWidget {
  const Birthday({super.key});

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audios/audio.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  Uint8List? audiobytes;

  AudioPlayer player = AudioPlayer();

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
        setState(() {
          //refresh the UI
        });
      });
      autoPlay();
    });
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height.h,
            width: size.width.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.home_masterWelcome),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    //(size.height * 3 / 5).h,
                    height: (size.height * 3 / 5).h,
                    width: (size.width * 2 / 3).w,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (size.width * 0.1).w,
                              vertical: 12.0.h),
                          child: Text(
                            AppConstants.birthday,
                            textAlign: TextAlign.center,
                            style: AppStyles.h1.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: (size.width * 1 / 30).sp),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0.h,
                          ),
                          child: Text(
                            '@cus_name',
                            style: AppStyles.h4.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: (size.width * 1 / 30).sp),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            currentpostlabel,
                            style: TextStyle(fontSize: 25.sp),
                          ),
                        ),
                        SizedBox(
                            width: 400.w,
                            child: Slider(
                              inactiveColor: AppColors.focus,
                              activeColor: Colors.amber,
                              value: double.parse(currentpos.toString()),
                              min: 0,
                              max: double.parse(maxduration.toString()),
                              divisions: maxduration,
                              label: currentpostlabel,
                              onChanged: (double value) async {
                                int seekval = value.round();
                                int result = await player
                                    .seek(Duration(milliseconds: seekval));
                                if (result == 1) {
                                  //seek successful
                                  currentpos = seekval;
                                } else {
                                  debugPrint("Seek unsuccessful.");
                                }
                              },
                            )),
                        Wrap(
                          spacing: 10,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.focus,
                                ),
                                onPressed: () async {
                                  if (!isplaying && !audioplayed) {
                                    int result =
                                        await player.playBytes(audiobytes!);
                                    if (result == 1) {
                                      //play success
                                      setState(() {
                                        isplaying = true;
                                        audioplayed = true;
                                      });
                                    } else {
                                      debugPrint("Error while playing audio.");
                                    }
                                  } else if (audioplayed && !isplaying) {
                                    int result = await player.resume();
                                    if (result == 1) {
                                      //resume success
                                      setState(() {
                                        isplaying = true;
                                        audioplayed = true;
                                      });
                                    } else {
                                      debugPrint("Error on resume audio.");
                                    }
                                  } else {
                                    int result = await player.pause();
                                    if (result == 1) {
                                      //pause success
                                      setState(() {
                                        isplaying = false;
                                      });
                                    } else {
                                      debugPrint("Error on pause audio.");
                                    }
                                  }
                                },
                                icon: Icon(
                                  isplaying ? Icons.pause : Icons.play_arrow,
                                  color: AppColors.black,
                                ),
                                label: Text(
                                  isplaying ? "Tạm dừng" : "Phát",
                                  style:
                                      const TextStyle(color: AppColors.black),
                                )),
                          ],
                        ),
                      ],
                    )),
                Padding(padding: EdgeInsets.only(top: 20.h)),
                SizedBox(
                  width: 210.w,
                  height: 50.h,
                  child: Material(
                    color: AppColors.focus,
                    borderRadius: BorderRadius.circular(5.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      autofocus: true,
                      focusColor: AppColors.orangeColor,
                      onTap: () {
                        player.stop();
                        Get.offNamed('/mainscreen');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bấm để chuyển tiếp'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
