// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/core/controller/smart_map_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';
import 'package:smarttv_app/app/modules/abtraction/loading/abtraction_loading.dart';
import 'package:smarttv_app/app/modules/abtraction/loading/map_loading.dart';
import 'package:smarttv_app/app/modules/abtraction/widget/abtraction_card.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';
import 'package:smarttv_app/config/build_config.dart';

class AbtractionScreen extends StatefulWidget {
  const AbtractionScreen({super.key});

  @override
  State<AbtractionScreen> createState() => _AbtractionScreenState();
}

class _AbtractionScreenState extends State<AbtractionScreen> {
  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    SmartMapController mapController = SmartMapController();

    return GetBuilder<AbtractionController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                TitleScreen(
                  name: "abtraction".tr,
                ),
                Expanded(
                  child: Row(
                    children: [
                      controller.abtractions.value.isEmpty
                          ? const AbtractionLoading()
                          : Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CarouselSlider.builder(
                                      options: CarouselOptions(
                                        onPageChanged: (index, reason) {
                                          controller.indexMarker = index;
                                        },
                                        scrollDirection: Axis.vertical,
                                        enlargeCenterPage: true,
                                        height: 400.h,
                                        viewportFraction: .7,
                                      ),
                                      itemCount:
                                          controller.abtractions.value.length,
                                      itemBuilder: (context, index, realIndex) {
                                        return AbtractionCard(
                                            abtractionContent: controller
                                                .abtractions.value[index],
                                            index: index,
                                            mapController: mapController);
                                      },
                                    ),
                                  ],
                                ),
                              )),
                      controller.abtractions.value.isEmpty
                          ? const MapLoading()
                          : Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svg/marker_red.svg",
                                        color: AppColors.orangeColor,
                                        height: 20.h,
                                      ),
                                      Text(
                                        "Vị trí hiện tại",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      SvgPicture.asset(
                                        "assets/svg/marker_circle.svg",
                                        color: AppColors.red,
                                        height: 20.h,
                                      ),
                                      Text(
                                        "Vị trí đang chỉ định",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15.sp),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.r),
                                    width: 500.w,
                                    height: 456.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: FlutterMap(
                                        mapController: mapController.controller,
                                        options: MapOptions(
                                          keepAlive: true,
                                          center: LatLng(10.838606359520535,
                                              106.83161588307689),
                                          zoom: 14.0,
                                        ),
                                        children: [
                                          TileLayer(
                                            urlTemplate: BuildConfig.instance
                                                .mapConfig.mapboxUrlTemplate,
                                            additionalOptions: {
                                              "access_token": BuildConfig
                                                  .instance
                                                  .mapConfig
                                                  .mapboxAccessToken,
                                              "id": BuildConfig
                                                  .instance.mapConfig.mapboxId,
                                            },
                                          ),
                                          MarkerLayer(
                                            markers: [
                                              Marker(
                                                point: LatLng(
                                                    10.838606359520535,
                                                    106.83161588307689),
                                                builder: (context) {
                                                  return SvgPicture.asset(
                                                    "assets/svg/marker_red.svg",
                                                    color:
                                                        AppColors.orangeColor,
                                                  );
                                                },
                                              ),
                                              for (int i = 0;
                                                  i <
                                                      controller.abtractions
                                                          .value.length;
                                                  i++)
                                                Marker(
                                                  point: LatLng(
                                                    controller
                                                            .abtractions
                                                            .value[i]
                                                            .latidute ??
                                                        0,
                                                    controller
                                                            .abtractions
                                                            .value[i]
                                                            .longtitude ??
                                                        0,
                                                  ),
                                                  builder: (context) {
                                                    return SvgPicture.asset(
                                                      "assets/svg/marker_circle.svg",
                                                      color: controller
                                                                  .indexMarker ==
                                                              i
                                                          ? AppColors.red
                                                          : AppColors
                                                              .background,
                                                    );
                                                  },
                                                ),
                                              /*
                                        
                                          point: LatLng(10.841504426896728,
                                              106.80972219406588),
                                         */

                                              /*
                                          LatLng(10.845259719568647,
                                              106.8201004328285),
                                         */
                                              /*
                                      LatLng(10.84246140890824,
                                              106.82356442059825),
                                       */

                                              /*
                                        LatLng(
                                              10.842250662716, 106.82903612634817),
                                       */
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
