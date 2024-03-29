import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class BookingController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<BookingContent?> bookingContent = Rx<BookingContent?>(null);

  @override
  void onInit() async {
    fetchBooking(roomId);
    super.onInit();
  }

  Future<void> fetchBooking(int roomId) async {
    var overview = _repository.getBookingByRoomId(roomId);
    await callDataService(
      overview,
      onSuccess: (BookingContent response) {
        bookingContent(response);
      },
      onError: ((dioError) {}),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(bookId, bookingContent.value?.id ?? (-1));
  }
}
