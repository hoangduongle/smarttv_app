// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/image_content.dart';

class ServiceCategoryContent {
  int? id;
  String? name;
  String? description;
  bool? foodAndBeverage;
  bool? ordered;
  bool? status;
  List<ImageContent>? images;
  int? hotelId;

  ServiceCategoryContent(
      {this.id,
      this.name,
      this.description,
      this.foodAndBeverage,
      this.ordered,
      this.status,
      this.images,
      this.hotelId});

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    foodAndBeverage = json['foodAndBeverage'];
    ordered = json['ordered'];
    status = json['status'];
    if (json['images'] != null) {
      images = <ImageContent>[];
      json['images'].forEach((v) {
        images!.add(ImageContent.fromJson(v));
      });
    }
    hotelId = json['hotel_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['foodAndBeverage'] = this.foodAndBeverage;
    data['ordered'] = this.ordered;
    data['status'] = this.status;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['hotel_Id'] = this.hotelId;
    return data;
  }
}
