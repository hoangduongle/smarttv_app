import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class EventController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<EventContent>> eventList = Rx<List<EventContent>>([]);

  Rx<List<EventContent>> eventListOn = Rx<List<EventContent>>([]);
  Rx<List<EventContent>> eventListReady = Rx<List<EventContent>>([]);
  Rx<List<EventContent>> eventListDone = Rx<List<EventContent>>([]);

  int indexMarker = 0;

  @override
  void onInit() {
    // fetchEvents();
    super.onInit();
  }

  Future<void> fetchEvents() async {
    var overview = _repository.getListEvent();
    List<EventContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<EventContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    eventList(result);
    filterEvent();
  }

  var isFocus = [false, false, false];

  void filterEvent() {
    DateTime currentDay = DateTime.now();
    for (int i = 0; i < eventList.value.length; i++) {
      DateTime parseEnd =
          DateFormat('dd/MM/yyyy').parse(eventList.value[i].endDate.toString());
      DateTime parseStart = DateFormat('dd/MM/yyyy')
          .parse(eventList.value[i].startDate.toString());
      if (currentDay.isBefore(parseStart)) {
        eventListReady.value.add(eventList.value[i]);
      }
      if (currentDay.isAfter(parseStart) && currentDay.isBefore(parseEnd)) {
        eventListOn.value.add(eventList.value[i]);
      }
    }
  }

  // List<Marker> markers = [
  //   Marker(
  //     point: LatLng(10.838606359520535, 106.83161588307689),
  //     builder: (context) => SvgPicture.asset(
  //       "assets/svg/marker_red.svg",
  //       color: AppColors.background,
  //     ),
  //   ),
  // ];
}
