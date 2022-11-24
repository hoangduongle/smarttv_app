// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/payment_method_content.dart';

class OrderContent {
  int? id;
  OrderPayment? orderPayment;
  List<OrderDetailContent>? orderDetails;
  double? totalAmount;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;
  String? status;

  OrderContent(
      {this.id,
      this.orderPayment,
      this.orderDetails,
      this.totalAmount,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy,
      this.status});

  OrderContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderPayment = json['orderPayment'] != null
        ? OrderPayment.fromJson(json['orderPayment'])
        : null;
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetailContent>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(OrderDetailContent.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.orderPayment != null) {
      data['orderPayment'] = this.orderPayment!.toJson();
    }
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this.totalAmount;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    data['status'] = this.status;
    return data;
  }
}

class OrderPayment {
  int? id;
  double? paymentAmount;
  String? dateTime;
  PaymentMethodContent? paymentMethod;

  OrderPayment(
      {this.id, this.paymentAmount, this.dateTime, this.paymentMethod});

  OrderPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentAmount = json['paymentAmount'];
    dateTime = json['dateTime'];
    paymentMethod = json['paymentMethod'] != null
        ? PaymentMethodContent.fromJson(json['paymentMethod'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['paymentAmount'] = this.paymentAmount;
    data['dateTime'] = this.dateTime;
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod!.toJson();
    }
    return data;
  }
}
