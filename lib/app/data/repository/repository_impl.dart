// ignore_for_file: unused_element, unused_local_variable, unnecessary_brace_in_string_interps, await_only_futures
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_repository.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/core/model/alarm_content.dart';
import 'package:smarttv_app/app/core/model/customer_content.dart';
import 'package:smarttv_app/app/core/model/customer_feedback.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/orderRequest.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/model/order_payment_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/dio/dio_provider.dart';
import 'package:smarttv_app/app/core/model/vnpay.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';

class RepositoryImpl extends BaseRepository implements Repository {
//=========================================================================Image
  @override
  Future<List<ImageContent>> getListImage() async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/image/getImageByImageTypeContain";
    var data = {'type': 'img'};
    var result = <ImageContent>[];
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <ImageContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(ImageContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

//=======================================================================Service
  @override
  Future<List<ServiceCategoryContent>> getListServiceCate() async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/serviceCategories";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <ServiceCategoryContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(ServiceCategoryContent.fromJson(element));
        }

        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/service";
    var data = {"cate_id": cateId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <ServiceContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(ServiceContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

//==========================================================================News
  @override
  Future<List<NewsContent>> getListNewsByType(String type) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/new";
    var data = {"type": type};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <NewsContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(NewsContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

//====================================================================Abtraction
  @override
  Future<List<AbstractionsContent>> getListAbtraction() async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/abstractions";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <AbstractionsContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(AbstractionsContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

//=========================================================================Order
  @override
  Future<List<OrderContent>> getOrderByBookingId(int bookingId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/order/orderByBooking";
    var data = {'booking_id': bookingId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <OrderContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(OrderContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderDetailContent>> getOrderdetailByOrderId(int orderId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/orderDetail";
    var data = {"order_id": orderId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <OrderDetailContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(OrderDetailContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> insertOrderdetail(OrderDetailContent orderDetailContent) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/orderDetail";
    var data = {
      "amount": orderDetailContent.amount,
      "orderDate": orderDetailContent.orderDate,
      'id': 0,
      "order_Id": orderDetailContent.orderId,
      "price": orderDetailContent.price,
      "quantity": orderDetailContent.quantity,
      "service_Id": orderDetailContent.service?.id,
    };
    var fromData = FormData.fromMap(data);
    var dioCall = dioTokenClient.post(endpoint, data: fromData);
    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> insertOrderRequest(OrderRequest orderRequest) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/order/orderService";
    var data = orderRequest.toJson();
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateOrderByOrderId(OrderContent orderContent) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt(bookId);
    var endpoint = "${DioProvider.baseUrl}/order";
    var data = {
      "booking_Id": bookingId,
      "createBy": orderContent.createBy,
      "createDate": orderContent.createDate,
      "id": orderContent.id,
      "lastModifyBy": orderContent.lastModifyBy,
      "totalAmount": orderContent.totalAmount,
      "updateDate": orderContent.updateDate,
      "status": orderContent.status,
    };
    var formData = FormData.fromMap(data);
    var dioCall = dioTokenClient.put(endpoint, data: formData);
    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderPaymentContent> getOrderPaymentByOrderId(int orderId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/billPayment/${orderId}";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        return OrderPaymentContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderContent> getOrderId(int id) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/order/${id}";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        return OrderContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

//=======================================================================Booking
  @override
  Future<BookingContent> getBookingByRoomId(int roomId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/booking/bookingByRoomId";
    var data = {"room_id": roomId};
    var fromData = FormData.fromMap(data);
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <BookingContent>[];
        return BookingContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CustomerContent> getPrimaryCustomerByBookingId(int bookingId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint =
        "${DioProvider.baseUrl}/customer/getPrimaryCustomerByBookingId?booking_id=${bookingId}";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        return CustomerContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

//==================================================================Notification
  @override
  Future<List<MessageContent>> getListMessage(int bookingId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/message/messagesByBooking";
    var data = {"booking_id": bookingId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <MessageContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(MessageContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

//=======================================================================Payment
  @override
  Future<MomoContent> momoPayment(double amount, List<String> orderId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/momo";
    var data = {
      "amount": amount,
      "orderId": orderId,
    };
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <MomoContent>[];
        return MomoContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VNPayContent> vnPayPayment(int orderId, double amount) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/vnpay";
    var data = {
      "vnp_BankCode": "VnPayQR",
      "vnp_IpAddr": "192.168.1.1",
      "vnp_Locale": "vn",
      "vnp_OrderInfo": "Thanh toán VNPay",
      "vnp_amount": amount,
      "orderId": orderId,
    };
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <VNPayContent>[];
        return VNPayContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

//===============================================================Request Service
  @override
  Future<int> requestService(int bookingId, String dateTime, int id,
      String name, String type, String status) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/requestService";
    var data = {
      "booking_Id": bookingId,
      "dateTime": dateTime,
      "id": id,
      "requestServiceName": name,
      "requestServiceType": type,
      "status": status
    };
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <RequestServiceContent>[];
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RequestServiceContent> getRequestService(int bookingId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/requestService";
    var data = {"bookingId": bookingId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        return RequestServiceContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

//=========================================================================Alarm
  @override
  Future<AlarmContent> insertAlarm(AlarmContent alarmContent) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/roomAlarm";
    var data = {
      'booking_Id': alarmContent.bookingId,
      'dateTime': alarmContent.dateTime,
      'id': 0,
      'status': alarmContent.status,
    };
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        return AlarmContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AlarmContent>> getListAlarm(int bookingId) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/roomAlarmByBooking";
    var data = {'booking_Id': bookingId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    var result = <AlarmContent>[];
    try {
      return callApi(dioCall).then((response) {
        for (var element in (response.data as List<dynamic>)) {
          result.add(AlarmContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> deleteAlarm(int id) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/roomAlarm/$id";
    var dioCall = dioTokenClient.delete(endpoint);

    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateAlarm(AlarmContent alarmContent) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/roomAlarm";
    var data = {
      'booking_Id': alarmContent.bookingId,
      'dateTime': alarmContent.dateTime,
      'id': alarmContent.id,
      'status': alarmContent.status,
    };
    var dioCall = dioTokenClient.put(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

//=======================================================================FeedBack
  @override
  Future<List<FeedbackContent>> getListFeedbackContent() async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/feedbackContents";
    var dioCall = dioTokenClient.get(endpoint);

    try {
      return callApi(dioCall).then((response) {
        var result = <FeedbackContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(FeedbackContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CustomerFeedback>> getListCustomerFeedback(int bookingIid) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint =
        "${DioProvider.baseUrl}/customerFeedBack/customerFeedbackByBooking?booking_id=$bookingIid";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <CustomerFeedback>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(CustomerFeedback.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> insertCustomerFeedback(CustomerFeedback customerFeedback) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/customerFeedBack";
    var data = customerFeedback.toJson();
    var dioCall = dioTokenClient.post(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        return response.statusCode ?? -1;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateCustomerFeedback(CustomerFeedback customerFeedback) async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/customerFeedBack";
    var data = {
      'booking_Id': customerFeedback.booking?.id,
      'dateTime': customerFeedback.dateTime,
      'feedbackContent_Id': customerFeedback.feedbackContent?.id,
      'id': customerFeedback.id,
      'rating': customerFeedback.rating
    };
    var dioCall = dioTokenClient.put(endpoint, data: data);
    try {
      return callApi(dioCall).then((response) {
        return response.data['resultCode'] ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }
//=============================================================Top 3 Sale Service

  @override
  Future<List<String>> serviceTop() async {
    if (!TokenManager.instance.hasToken) {
      await TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/serviceTop";
    var result = <String>[];
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <String>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(element);
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }
}
