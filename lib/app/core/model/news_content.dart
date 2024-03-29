// ignore_for_file: unnecessary_this

import 'package:smarttv_app/app/core/model/image_content.dart';

class NewsContent {
  int? id;
  String? newName;
  String? ticketInformation;
  String? detailInformation;
  String? address;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? newType;
  String? status;
  int? numberOfView;
  ImageContent? image;

  NewsContent(
      {this.id,
      this.newName,
      this.ticketInformation,
      this.detailInformation,
      this.address,
      this.description,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.newType,
      this.status,
      this.numberOfView,
      this.image});

  NewsContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newName = json['newName'];
    ticketInformation = json['ticketInformation'];
    detailInformation = json['detailInformation'];
    address = json['address'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    newType = json['newType'];
    status = json['status'];
    numberOfView = json['numberOfView'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['newName'] = this.newName;
    data['ticketInformation'] = this.ticketInformation;
    data['detailInformation'] = this.detailInformation;
    data['address'] = this.address;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['newType'] = this.newType;
    data['status'] = this.status;
    data['numberOfView'] = this.numberOfView;
    return data;
  }
}
