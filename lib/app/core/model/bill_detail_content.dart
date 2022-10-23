// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

import 'package:smarttv_app/app/core/model/service_content.dart';

class BillDetailContent {
  int? id;
  ServiceContent? service;
  int? billId;
  int? quantity;
  double? price;
  double? amount;
  int? status;
  String? billDate;

  BillDetailContent(
      {this.id,
      this.service,
      this.billId,
      this.quantity,
      this.price,
      this.amount,
      this.status,
      this.billDate});

  BillDetailContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service =
        json['service'] != null ? new ServiceContent.fromJson(json['service']) : null;
    billId = json['bill_Id'];
    quantity = json['quantity'];
    price = json['price'];
    amount = json['amount'];
    status = json['status'];
    billDate = json['billDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['bill_Id'] = this.billId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['billDate'] = this.billDate;
    return data;
  }
}

