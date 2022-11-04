import 'package:get/get.dart';
import 'package:smarttv_app/app/core/controller/booking_controller.dart';
import 'package:smarttv_app/app/core/controller/image_controller.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/data/repository/repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Repository>(
      () => RepositoryImpl(),
      tag: (Repository).toString(),
      fenix: true,
    );
    // Get.lazyPut<ImageController>(
    //   () => ImageController(),
    //   fenix: true,
    // );
    Get.put<BookingController>(BookingController());
  }
}
