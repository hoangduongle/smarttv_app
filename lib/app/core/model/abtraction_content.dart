// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/image_content.dart';

class AbtractionContent {
  int? id;
  String? name;
  double? longtitude;
  double? latidute;
  String? openTime;
  String? closeTime;
  String? address;
  String? description;
  int? hotelId;
  List<ImageContent>? images;

  AbtractionContent(
      {this.id,
      this.name,
      this.longtitude,
      this.latidute,
      this.openTime,
      this.closeTime,
      this.address,
      this.description,
      this.hotelId,
      this.images});

  AbtractionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    longtitude = json['longtitude'];
    latidute = json['latidute'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    address = json['address'];
    description = json['description'];
    hotelId = json['hotel_Id'];
    if (json['images'] != null) {
      images = <ImageContent>[];
      json['images'].forEach((v) {
        images!.add(ImageContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['longtitude'] = this.longtitude;
    data['latidute'] = this.latidute;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['address'] = this.address;
    data['description'] = this.description;
    data['hotel_Id'] = this.hotelId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
