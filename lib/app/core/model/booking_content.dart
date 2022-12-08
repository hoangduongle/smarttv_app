// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/customer_content.dart';

class BookingContent {
  int? id;
  int? confirmationNo;
  String? arrivalDate;
  String? actualArrivalDate;
  String? departureDate;
  String? actualDepartureDate;
  int? numOfAdult;
  int? numOfChildren;
  double? totalAmount;
  String? roomPayment;
  String? specialNote;
  String? status;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;
  int? roomTypeId;
  int? hotelId;
  int? roomId;
  CustomerContent? customer;

  BookingContent({
    this.id,
    this.confirmationNo,
    this.arrivalDate,
    this.actualArrivalDate,
    this.departureDate,
    this.actualDepartureDate,
    this.numOfAdult,
    this.numOfChildren,
    this.totalAmount,
    this.roomPayment,
    this.specialNote,
    this.status,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.lastModifyBy,
    this.roomTypeId,
    this.hotelId,
    this.roomId,
    this.customer,
  });

  BookingContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    confirmationNo = json['confirmationNo'];
    arrivalDate = json['arrivalDate'];
    actualArrivalDate = json['actualArrivalDate'];
    departureDate = json['departureDate'];
    actualDepartureDate = json['actualDepartureDate'];
    numOfAdult = json['numOfAdult'];
    numOfChildren = json['numOfChildren'];
    totalAmount = json['totalAmount'];
    roomPayment = json['roomPayment'];
    specialNote = json['specialNote'];
    status = json['status'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
    roomTypeId = json['roomTypeId'];
    hotelId = json['hotel_Id'];
    roomId = json['room_Id'];
    customer = json['customer'] != null
        ? CustomerContent.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['confirmationNo'] = this.confirmationNo;
    data['arrivalDate'] = this.arrivalDate;
    data['actualArrivalDate'] = this.actualArrivalDate;
    data['departureDate'] = this.departureDate;
    data['actualDepartureDate'] = this.actualDepartureDate;
    data['numOfAdult'] = this.numOfAdult;
    data['numOfChildren'] = this.numOfChildren;
    data['totalAmount'] = this.totalAmount;
    data['roomPayment'] = this.roomPayment;
    data['specialNote'] = this.specialNote;
    data['status'] = this.status;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    data['roomTypeId'] = this.roomTypeId;
    data['hotel_Id'] = this.hotelId;
    data['room_Id'] = this.roomId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}
