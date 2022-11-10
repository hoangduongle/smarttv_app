// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/service_content.dart';

class OrderDetailContent {
  int? id;
  ServiceContent? service;
  int? orderId;
  int? quantity;
  double? price;
  double? amount;
  String? orderDate;

  OrderDetailContent(
      {this.id,
      this.service,
      this.orderId,
      this.quantity,
      this.price,
      this.amount,
      this.orderDate});

  OrderDetailContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'] != null
        ? ServiceContent.fromJson(json['service'])
        : null;
    orderId = json['order_Id'];
    quantity = json['quantity'];
    price = json['price'];
    amount = json['amount'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['order_Id'] = this.orderId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['orderDate'] = this.orderDate;
    return data;
  }
}
