import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
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
    filterEvent();
  }

  // var isFocus = [false, false, false];

  void filterEvent() {
    eventListOn.value.clear();
    eventListReady.value.clear();
    eventListDone.value.clear();
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
