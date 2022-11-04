import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/event/loading/skeleton_event.dart';
import 'package:smarttv_app/app/modules/event/widget/build_event.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';
import 'package:smarttv_app/config/build_config.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<EventController>(
      builder: (controller) {
        return Scaffold(
            body: Container(
                color: AppColors.background,
                child: Column(
                  children: [
                    TitleScreen(
                      name: "event".tr,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          controller.eventList.value.isEmpty
                              ? const SkeletonEvent()
                              : Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CarouselSlider.builder(
                                          options: CarouselOptions(
                                            onPageChanged: (index, reason) {
                                              controller.indexMarker = index;
                                            },
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            initialPage: 0,
                                            enlargeCenterPage: true,
                                            height: (size.height - 200).h,
                                            viewportFraction: .6,
                                          ),
                                          itemCount:
                                              controller.eventList.value.length,
                                          itemBuilder:
                                              (context, index, realIndex) {
                                            return BuildEvent(
                                                indexType: 0,
                                                index: index,
                                                eventContent: controller
                                                    .eventList.value[index],
                                                controller: controller);
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              width: 500.w,
                              height: 500.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: FlutterMap(
                                  options: MapOptions(
                                    keepAlive: true,
                                    center: LatLng(
                                        10.838606359520535, 106.83161588307689),
                                    zoom: 14.0,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate: BuildConfig
                                          .instance.mapConfig.mapboxUrlTemplate,
                                      additionalOptions: {
                                        "access_token": BuildConfig.instance
                                            .mapConfig.mapboxAccessToken,
                                        "id": BuildConfig
                                            .instance.mapConfig.mapboxId,
                                      },
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        // for (var event
                                        //     in controller.eventList.value)
                                          Marker(
                                            point: LatLng(10.838606359520535,
                                                106.83161588307689),
                                            builder: (context) =>
                                                SvgPicture.asset(
                                              "assets/svg/marker_red.svg",
                                              color: controller.indexMarker == 0
                                                  ? AppColors.red
                                                  : AppColors.background,
                                            ),
                                          ),
                                        Marker(
                                          point: LatLng(10.841504426896728,
                                              106.80972219406588),
                                          builder: (context) =>
                                              SvgPicture.asset(
                                            "assets/svg/marker_red.svg",
                                            color: controller.indexMarker == 1
                                                ? AppColors.red
                                                : AppColors.background,
                                          ),
                                        ),
                                        Marker(
                                          point: LatLng(10.845259719568647,
                                              106.8201004328285),
                                          builder: (context) =>
                                              SvgPicture.asset(
                                            "assets/svg/marker_red.svg",
                                            color: controller.indexMarker == 2
                                                ? AppColors.red
                                                : AppColors.background,
                                          ),
                                        ),
                                        Marker(
                                          point: LatLng(10.84246140890824,
                                              106.82356442059825),
                                          builder: (context) =>
                                              SvgPicture.asset(
                                            "assets/svg/marker_red.svg",
                                            color: controller.indexMarker == 3
                                                ? AppColors.red
                                                : AppColors.background,
                                          ),
                                        ),
                                        Marker(
                                          point: LatLng(10.842250662716,
                                              106.82903612634817),
                                          builder: (context) =>
                                              SvgPicture.asset(
                                            "assets/svg/marker_red.svg",
                                            color: controller.indexMarker == 4
                                                ? AppColors.red
                                                : AppColors.background,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
