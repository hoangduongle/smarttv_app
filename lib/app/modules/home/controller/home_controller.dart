// ignore_for_file: non_constant_identifier_names, must_call_super, unused_field

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class HomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  // List<OverviewContent> overviewList = [];
  Rx<List<OverviewContent>> overviewList = Rx<List<OverviewContent>>([
    OverviewContent(
        id: 1,
        title: "hotel",
        description: "hotel",
        imageUrl: "assets/svg/Overview_hotel.svg"),
    OverviewContent(
        id: 2,
        title: "food",
        description: "food",
        imageUrl: "assets/svg/Overview_food.svg"),
    OverviewContent(
        id: 3,
        title: "service",
        description: "service",
        imageUrl: "assets/svg/Overview_service.svg"),
    OverviewContent(
        id: 4,
        title: "event",
        description: "event",
        imageUrl: "assets/svg/Overview_event.svg"),
  ]);

  var currentInt = 0.obs;
}





















    // HomeProvider().getPostsList(
    //   beforeSend: () {},
    //   onSuccess: (Overview) {
    //     overviewList.addAll(Overview);
    //     isLoading = false;
    //     debugPrint("HomePage Api: Success");
    //     update();
    //   },
    //   onError: (error) {
    //     // isLoading = false;
    //     update();
    //     debugPrint("HomePage Api: Error");
    //   },
    // );