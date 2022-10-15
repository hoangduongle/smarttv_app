import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/model/promotion_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';

abstract class Repository {
  // Future<List<OverviewContent>> getListOverview();
  Future<List<ServiceCategoryContent>> getListServiceCate();
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId);
  Future<ServiceContent> getServiceContentById(int serviceId);
  Future<List<EventContent>> getListEvent();
  Future<List<AbtractionContent>> getListAbtraction();
  Future<List<PromotionContent>> getListPromotion();
  Future<BillContent> getBillById(int billId);
  Future<int> updateBillByBillId(String createBy, String createDate,int billId, String lastModifyBy, double totalAmount, String updateDate);
  Future<List<BillDetailContent>> getBilldetailByBillId(int billId);
  Future<BookingContent> getBookingByRoomId();
  // Future<List<>> getListNotification();

}
