import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';

abstract class Repository {
  Future<List<OverviewContent>> getListOverview();
  Future<List<ServiceCategoryContent>> getListServiceCate();

  Future<List<ServiceContent>> getListServiceContentByCateId();
  Future<ServiceContent> getServiceContentById();

  Future<List<EventContent>> getListEvent();
  Future<List<AbtractionContent>> getListAbtraction();

  Future<BillContent> getBillByRoomId();
  Future<BillContent> updateBillByBillId(int billId);


  Future<BookingContent> getBookingByRoomId();
  // Future<List<>> getListNotification();

}
