// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/modules/local/controller/local_controller.dart';

import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_styles.dart';

class LocalScreen extends GetView<LocalController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var marker = <Marker>[];
    marker = [
      Marker(
        point: LatLng(10.84120135370617, 106.80990445537724),
        builder: (context) => const Icon(
          Icons.pin_drop,
          color: AppColors.focus,
        ),
      )
    ];
    return Scaffold(
      body: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 42.h, left: 15.w),
                      child: Text(
                        'Địa điểm ăn uống',
                        style: AppStyles.h4.copyWith(
                            color: AppColors.header,
                            fontSize: (size.width * 25 / 1000).sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Flexible(
                            child: FlutterMap(
                              options: MapOptions(
                                center: LatLng(
                                    10.84120135370617, 106.80990445537724),
                                zoom: 20,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName: 'com.example.app',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      point: LatLng(10.84120135370617,
                                          106.80990445537724),
                                      builder: (context) {
                                        return Icon(Icons.pin_drop);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
