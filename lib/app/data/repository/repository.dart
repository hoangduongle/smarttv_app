import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/orderRequest.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/model/order_payment_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/model/vnpay.dart';

abstract class Repository {
  Future<List<ImageContent>> getListImage();
//========================Service=============================================
  Future<List<ServiceCategoryContent>> getListServiceCate();
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId);
//=========================News===============================================
  Future<List<NewsContent>> getListNewsByType(String type);
//===========================Abtraction=========================================
  Future<List<AbtractionContent>> getListAbtraction();
//==============================Order============================================
  Future<List<OrderContent>> getOrderByBookingId(int bookingId);
  Future<OrderContent> getOrderId(int id);
  Future<List<OrderDetailContent>> getOrderdetailByOrderId(int orderId);
  Future<int> updateOrderByOrderId(OrderContent orderContent);
  Future<int> insertOrderdetail(OrderDetailContent orderDetailContent);
  Future<int> insertOrderRequest(OrderRequest orderRequest);
  Future<OrderPaymentContent> getOrderPaymentByOrderId(int orderId);
//===============================Booking========================================
  Future<BookingContent> getBookingByRoomId(int roomId);
//===============================Notification===================================
  Future<List<MessageContent>> getListMessage(int bookingId);
//==============================================================================
  Future<MomoContent> momoPayment(
    double amount,
    List<String> orderId,
  );
  Future<int> queryTransaction(
    String partnerCode,
    int requestId,
    int orderId,
    String lang,
    String signature,
  );
  Future<VNPayContent> vnPayPayment(int orderId, double amount);
//============================Request Service===================================
  Future<int> requestService(int bookingId, String dateTime, int id,
      String name, String type, String status);
  Future<RequestServiceContent> getRequestService(int bookingId);
//===============================Alarm==========================================
  Future<AlarmContent> insertAlarm(AlarmContent alarmContent);
  Future<int> deleteAlarm(int id);
  Future<int> updateAlarm(AlarmContent alarmContent);
  Future<List<AlarmContent>> getListAlarm(int bookingId);
//=================================FeedBack=====================================
  Future<List<FeedbackContent>> getListFeedbackContent();
  Future<List<CustomerFeedback>> insertCustomerFeedback(
      CustomerFeedback customerFeedback);
  Future<int> updateCustomerFeedback(CustomerFeedback customerFeedback);
}
