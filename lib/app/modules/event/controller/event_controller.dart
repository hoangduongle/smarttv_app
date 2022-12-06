import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/controller/image_controller.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class EventController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<NewsContent>> eventList = Rx<List<NewsContent>>([]);

  Rx<List<NewsContent>> eventListOn = Rx<List<NewsContent>>([]);
  Rx<List<NewsContent>> eventListReady = Rx<List<NewsContent>>([]);
  Rx<List<NewsContent>> eventListDone = Rx<List<NewsContent>>([]);
  int indexMarker = 0;

  @override
  Future<void> onInit() async {
    fetchNewsEvent();
    super.onInit();
  }

  Future<void> reload() async {
    await onInit();
  }

  Future<void> fetchNewsEvent() async {
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
    addImage();
    filterEvent();
  }

  void addImage() {
    ImageController imageController = Get.find();
    if (imageController.imageContent.value.isEmpty) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          return addImage();
        },
      );
    } else {
      for (int i = 0; i < eventList.value.length; i++) {
        eventList.value[i].image =
            imageController.getImageById("new_${eventList.value[i].id}");
      }
    }
    update();
  }

  void filterEvent() {
    eventListOn.value.clear();
    eventListReady.value.clear();
    eventListDone.value.clear();
    DateTime currentDay = DateTime.now();
    for (int i = 0; i < eventList.value.length; i++) {
      DateTime parseEnd =
          DateFormat('dd/MM/yyyy').parse(eventList.value[i].endDate.toString());

      DateTime parseStart = DateFormat('dd/MM/yyyy')
          .parse(eventList.value[i].startDate.toString());
      if (currentDay.isBefore(parseStart)) {
        eventListReady.value.add(eventList.value[i]); //sap dien ra
      } else if (currentDay.isAfter(parseStart) &&
          currentDay.isBefore(parseEnd)) {
        eventListOn.value.add(eventList.value[i]); // dang dien ra
      } else {
        eventListDone.value.add(eventList.value[i]); //da dien ra
      }
    }
    debugPrint("Event ${DateTimeUtils.currentDateTimeSecond()}");
  }
}
