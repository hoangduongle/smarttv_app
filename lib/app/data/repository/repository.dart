import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/orderRequest.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/model/vnpay.dart';

abstract class Repository {
  // Future<List<ImageContent>> getListImageByType(String type);
//========================Service=============================================
  Future<List<ServiceCategoryContent>> getListServiceCate();
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId);
//=========================News===============================================
  Future<List<NewsContent>> getListNewsByType(String type);
//===========================Abtraction=========================================
  Future<List<AbtractionContent>> getListAbtraction();
//==============================Order============================================
  Future<List<OrderContent>> getOrderByBookingId(int bookingId);
  Future<OrderContent> getOrderId(int Id);
  Future<List<OrderDetailContent>> getOrderdetailByOrderId(int orderId);
  Future<int> updateOrderByOrderId(OrderContent orderContent);
  Future<int> insertOrderdetail(OrderDetailContent orderDetailContent);
  Future<int> insertOrderRequest(OrderRequest orderRequest);
//===============================Booking========================================
  Future<BookingContent> getBookingByRoomId(int roomId);
//===============================Notification===================================
  Future<List<MessageContent>> getListMessage(int bookingId);
//==============================================================================
  Future<MomoContent> momoPayment(
    int orderId,
  );
  Future<int> queryTransaction(
    String partnerCode,
    int requestId,
    int orderId,
    String lang,
    String signature,
  );
  Future<VNPayContent> vnPayPayment(int orderId, int orderInfo);
//============================Request Service===================================
  Future<int> requestService(int bookingId, String dateTime, int id,
      String name, String type, String status);
  Future<RequestServiceContent> getRequestService(int bookingId);
//===============================Alarm==========================================
  Future<int> insertAlarm(AlarmContent alarmContent);
  Future<int> deleteAlarm(AlarmContent alarmContent);
//=================================FeedBack=====================================
  Future<List<FeedbackContent>> getListFeedbackContent();
  Future<int> insertCustomerFeedback(CustomerFeedback customerFeedback);
}
