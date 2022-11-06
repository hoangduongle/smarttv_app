// ignore_for_file: unused_element, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:smarttv_app/app/core/base/base_repository.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/promotion_content.dart';
import 'package:smarttv_app/app/core/model/request_service.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/dio/dio_provider.dart';
import 'package:smarttv_app/app/data/dio/dio_token_manager.dart';
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
  Future<List<EventContent>> getListEvent() {
    var endpoint = "${DioProvider.baseUrl}/events";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <EventContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(EventContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BillContent> getBillById(int billId) {
    var endpoint = "${DioProvider.baseUrl}/bill/$billId";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <BillContent>[];
        return BillContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateBillByBillId(String createBy, String createDate, int billId,
      String lastModifyBy, double totalAmount, String updateDate) {
    var endpoint = "${DioProvider.baseUrl}/bill";
    var data = {
      "id": billId,
      "totalAmount": totalAmount,
      "createDate": createDate,
      "updateDate": updateDate,
      "createBy": createBy,
      "lastModifyBy": lastModifyBy
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
  Future<int> insertBilldetail(BillDetailContent billDetailContent) {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
    var endpoint = "${DioProvider.baseUrl}/billDetail";
    var data = {
      'id': 0,
      "service_Id": billDetailContent.service?.id,
      "bill_Id": billDetailContent.billId,
      "quantity": billDetailContent.quantity,
      "price": billDetailContent.price,
      "amount": billDetailContent.amount,
      "status": billDetailContent.status,
      "billDate": billDetailContent.billDate,
    };
    var fromData = FormData.fromMap(data);
    var dioCall = dioTokenClient.post(endpoint, data: fromData);
    try {
      return callApi(dioCall).then((response) {
        debugPrint(response.statusCode.toString());
        return response.statusCode ?? 0;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BillDetailContent>> getBilldetailByBillId(int billId) {
    var endpoint = "${DioProvider.baseUrl}/billDetail";
    var data = {"bill_id": billId};
    var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    try {
      return callApi(dioCall).then((response) {
        var result = <BillDetailContent>[];
        for (var element in (response.data as List<dynamic>)) {
          result.add(BillDetailContent.fromJson(element));
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PromotionContent>> getListPromotion() {
    var endpoint = "${DioProvider.baseUrl}/promotions";
    var dioCall = dioTokenClient.get(endpoint);
    try {
      return callApi(dioCall).then((response) {
        var result = <PromotionContent>[];

        for (var element in (response.data as List<dynamic>)) {
          result.add(PromotionContent.fromJson(element));
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
        debugPrint("${response.statusCode}");
        return MomoContent.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingContent> getBookingByRoomId(int roomId) {
    // var endpoint = "${DioProvider.baseUrl}/booking";
    // var data = {"room_id": roomId};
    // var dioCall = dioTokenClient.get(endpoint, queryParameters: data);
    // try {
    //   return callApi(dioCall).then((response) {
    //     var result = <BookingContent>[];
    //     var a = response.data;
    //     return BookingContent.fromJson(response.data);
    //   });
    // } catch (e) {
    //   rethrow;
    // }
    throw UnimplementedError();
  }

  @override
  Future<RequestServiceContent> requestService(int bookingId, String dateTime,
      int id, String name, String type, bool status) {
    // var endpoint = "${DioProvider.baseUrl}/requestService";
    // var data = {
    //   "booking_Id": bookingId,
    //   "dateTime": dateTime,
    //   "id": id,
    //   "requestServiceName": name,
    //   "requestServiceType": type,
    //   "status": status
    // };
    // var fromData = FormData.fromMap(data);
    // var dioCall = dioTokenClient.post(endpoint, data: data);
    // try {
    //   return callApi(dioCall).then((response) {
    //     var result = <RequestServiceContent>[];
    //     var a = response.data;
    //     return RequestServiceContent.fromJson(response.data);
    //   });
    // } catch (e) {
    //   rethrow;
    // }
    throw UnimplementedError();
  }
}
