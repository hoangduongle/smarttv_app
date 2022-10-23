import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class EventController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<EventContent>> eventList = Rx<List<EventContent>>([]);

  Rx<List<EventContent>> eventListOn = Rx<List<EventContent>>([]);
  Rx<List<EventContent>> eventListReady = Rx<List<EventContent>>([]);
  Rx<List<EventContent>> eventListDone = Rx<List<EventContent>>([]);

  @override
  void onInit() {
    fetchEvents();
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
    eventList.value.add(EventContent(result));
  }

  var isFocus = [false, false, false];
}
