// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/payment_method_content.dart';

class OrderPaymentContent {
  int? id;
  double? paymentAmount;
  String? dateTime;
  PaymentMethodContent? paymentMethod;
  OrderContent? order;

  OrderPaymentContent(
      {this.id,
      this.paymentAmount,
      this.dateTime,
      this.paymentMethod,
      this.order});

  OrderPaymentContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentAmount = json['paymentAmount'];
    dateTime = json['dateTime'];
    paymentMethod = json['paymentMethod'] != null
        ? PaymentMethodContent.fromJson(json['paymentMethod'])
        : null;
    order = json['order'] != null ? OrderContent.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['paymentAmount'] = this.paymentAmount;
    data['dateTime'] = this.dateTime;
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}
