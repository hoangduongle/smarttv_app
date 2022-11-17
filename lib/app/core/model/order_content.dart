// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/booking_content.dart';

class OrderContent {
  int? id;
  BookingContent? booking;
  double? totalAmount;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;
  String? status;

  OrderContent(
      {this.id,
      this.booking,
      this.totalAmount,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy,
      this.status});

  OrderContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    booking = json['booking'] != null
        ? BookingContent.fromJson(json['booking'])
        : null;
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
    data['booking_Id'] = this.booking!.id;
    data['totalAmount'] = this.totalAmount;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    data['status'] = this.status;
    return data;
  }

  @override
  String toString() {
    return 'OrderContent(id: $id, booking: $booking, totalAmount: $totalAmount, createDate: $createDate, updateDate: $updateDate, createBy: $createBy, lastModifyBy: $lastModifyBy, status: $status)';
  }
}
