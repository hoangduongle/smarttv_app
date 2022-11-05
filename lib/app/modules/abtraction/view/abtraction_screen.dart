// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/core/controller/smart_map_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';
import 'package:smarttv_app/app/modules/abtraction/loading/abtraction_loading.dart';
import 'package:smarttv_app/app/modules/abtraction/widget/abtraction_card.dart';
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
                          ? Container()
                          : Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CarouselSlider.builder(
                                      options: CarouselOptions(
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
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          width: 500.w,
                          height: 500.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: FlutterMap(
                              mapController: mapController.controller,
                              options: MapOptions(
                                onPositionChanged: (position, hasGesture) {},
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
                                    "access_token": BuildConfig
                                        .instance.mapConfig.mapboxAccessToken,
                                    "id":
                                        BuildConfig.instance.mapConfig.mapboxId,
                                  },
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(10.838606359520535,
                                          106.83161588307689),
                                      builder: (context) => SvgPicture.asset(
                                        "assets/svg/marker_red.svg",
                                        color: AppColors.red,
                                      ),
                                    ),
                                    // for (var event
                                    //     in controller.eventList.value)
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

/*
Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 42.h, left: 15.w),
                  child: Text(
                    "local".tr,
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: (size.width * 25 / 1000).sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    width: 750.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Text(
                      "Ngoài những dịch vụ sẵn có, khách sạn còn cung cấp cho quý khách các địa điểm được nhiều khách hàng trước đó trãi nghiệm và đánh giá cao. Từ những địa điểm này mong ràng quý khách có được thời gian trải nghiệm tuyệt với tại khách sạn của chúng tôi.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),

                ////////////////////
              ],
            )
 */
