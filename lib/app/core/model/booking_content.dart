// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/customer_content.dart';
import 'package:smarttv_app/app/core/model/room_content.dart';

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
  RoomContent? room;
  CustomerContent? customer;
  BillContent? bill;

  BookingContent(
      {this.id,
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
      this.room,
      this.customer,
      this.bill});

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
    room = json['room'] != null ?  RoomContent.fromJson(json['room']) : null;
    customer = json['customer'] != null
        ? CustomerContent.fromJson(json['customer'])
        : null;
    bill = json['bill'] != null ?  BillContent.fromJson(json['bill']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.bill != null) {
      data['bill'] = this.bill!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'BookingContent(id: $id, confirmationNo: $confirmationNo, arrivalDate: $arrivalDate, actualArrivalDate: $actualArrivalDate, departureDate: $departureDate, actualDepartureDate: $actualDepartureDate, numOfAdult: $numOfAdult, numOfChildren: $numOfChildren, totalAmount: $totalAmount, roomPayment: $roomPayment, specialNote: $specialNote, status: $status, createDate: $createDate, updateDate: $updateDate, createBy: $createBy, lastModifyBy: $lastModifyBy, room: $room, customer: $customer, bill: $bill)';
  }
}
