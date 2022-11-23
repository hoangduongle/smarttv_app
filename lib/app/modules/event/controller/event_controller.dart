import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class EventController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<NewsContent>> eventList = Rx<List<NewsContent>>([]);

  Rx<List<NewsContent>> eventListOn = Rx<List<NewsContent>>([]);
  Rx<List<NewsContent>> eventListReady = Rx<List<NewsContent>>([]);
  Rx<List<NewsContent>> eventListDone = Rx<List<NewsContent>>([]);

  int indexMarker = 0;

  @override
  void onInit() {
    fetchNewsEvent();
    super.onInit();
  }

  Stream<List<NewsContent>> eventsStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: SECONDS));
      List<NewsContent> events = await fetchNewsEvent();
      yield events;
    }
  }

  Future<List<NewsContent>> fetchNewsEvent() async {
    var overview = _repository.getListNewsByType("event");
    List<NewsContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<NewsContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    eventList(result);
    filterEvent();
    return eventList(result);
  }

  // var isFocus = [false, false, false];

  void filterEvent() {
    if (eventListOn.value.isNotEmpty) {
      eventListOn.value.clear();
    }
    if (eventListReady.value.isNotEmpty) {
      eventListReady.value.clear();
    }
    if (eventListDone.value.isNotEmpty) {
      eventListDone.value.clear();
    }
    for (int i = 0; i < eventList.value.length; i++) {
      switch (eventList.value[i].status) {
        case "ON":
          eventListOn.value.add(eventList.value[i]);
          break;
        case "READY":
          eventListReady.value.add(eventList.value[i]);
          break;
        case "DONE":
          eventListDone.value.add(eventList.value[i]);
          break;
        default:
      }
    }
    debugPrint("Event ${DateTimeUtils.currentDateTimeSecond()}");

    // DateTime currentDay = DateTime.now();
    // for (int i = 0; i < eventList.value.length; i++) {
    //   DateTime parseEnd =
    //       DateFormat('dd/MM/yyyy').parse(eventList.value[i].endDate.toString());
    //   DateTime parseStart = DateFormat('dd/MM/yyyy')
    //       .parse(eventList.value[i].startDate.toString());
    //   if (currentDay.isBefore(parseStart)) {
    //     eventListReady.value.add(eventList.value[i]);
    //   }
    //   if (currentDay.isAfter(parseStart) && currentDay.isBefore(parseEnd)) {
    //     eventListOn.value.add(eventList.value[i]);
    //   }
    // }
  }
}
