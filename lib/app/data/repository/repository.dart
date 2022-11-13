import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';

import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';

import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';

abstract class Repository {
  Future<List<ImageContent>> getListImageByType(String type);
  //========================Service=============================================
  Future<List<ServiceCategoryContent>> getListServiceCate();
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId);

  //=========================News===============================================
  Future<List<NewsContent>> getListNewsByType(String type);
//===========================Abtraction=========================================
  Future<List<AbtractionContent>> getListAbtraction();
//==============================Order============================================
  Future<List<OrderContent>> getOrderByBookingId(int bookingId);
  Future<int> updateOrderByOrderId(OrderContent orderContent);
  Future<int> insertOrderdetail(OrderDetailContent orderDetailContent);
  Future<List<OrderDetailContent>> getOrderdetailByOrderId(int orderId);
//===============================Booking========================================
  Future<BookingContent> getBookingByRoomId(int roomId);
//==============================================================================
  Future<List<MessageContent>> getListMessage(int bookingId);
//==============================================================================
  Future<MomoContent> momoPayment(int orderId, int orderInfo);
  Future<int> requestService(int bookingId, String dateTime, int id,
      String name, String type, String status);
  Future<RequestServiceContent> getRequestService(int bookingId);
}
