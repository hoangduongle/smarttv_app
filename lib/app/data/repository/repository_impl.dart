// ignore_for_file: unused_element, unused_local_variable

import 'package:dio/dio.dart';
import 'package:smarttv_app/app/core/base/base_repository.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/dio/dio_provider.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';

class RepositoryImpl extends BaseRepository implements Repository {
  @override
  Future<List<ServiceCategoryContent>> getListServiceCate() {
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
  Future<List<ServiceContent>> getListServiceContentByCateId(int cateId) {
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

  @override
  Future<List<AbtractionContent>> getListAbtraction() {
    var endpoint = "${DioProvider.baseUrl}/abstractions";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <AbtractionContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(AbtractionContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ImageContent>> getListImageByType(String type) {
    var endpoint = "${DioProvider.baseUrl}/image";
    var data = {"type": type};
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

  @override
  Future<MomoContent> momoPayment(int orderId, int orderInfo) {
    var endpoint = "${DioProvider.baseUrl}/momo";
    var data = {
      "lang": "vi",
      "orderId": orderId,
      "orderInfo": orderInfo,
      "storeId": 1,
    };
    var fromData = FormData.fromMap(data);
    var dioCall = dioTokenClient.post(endpoint, data: fromData);
    try {
      return callApi(dioCall).then((response) {
        var result = <MomoContent>[];
        // debugPrint("${response.statusCode}");
        return MomoContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingContent> getBookingByRoomId(int roomId) {
    var endpoint = "${DioProvider.baseUrl}/booking";
    var data = {"room_id": roomId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <BookingContent>[];
        return BookingContent.fromJson(response.data[0]);
      });
    } catch (e) {
      rethrow;
    }
    // throw UnimplementedError();
  }

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
    var fromData = FormData.fromMap(data);
    var dioCall = dioTokenClient.post(endpoint, data: fromData);
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
  Future<List<NewsContent>> getListNewsByType(String type) {
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

  @override
  Future<OrderContent> getOrderById(int orderId) {
    var endpoint = "${DioProvider.baseUrl}/order/$orderId";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <OrderContent>[];
        return OrderContent.fromJson(response.data);
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
  Future<int> updateOrderByOrderId(OrderContent orderContent) {
    var endpoint = "${DioProvider.baseUrl}/order";
    var data = {
      "createBy": orderContent.createBy,
      "createDate": orderContent.createDate,
      "id": orderContent.id,
      "lastModifyBy": orderContent.lastModifyBy,
      "totalAmount": orderContent.totalAmount,
      "updateDate": orderContent.updateDate,
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
  Future<RequestServiceContent> getRequestService(int bookingId) {
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
}
