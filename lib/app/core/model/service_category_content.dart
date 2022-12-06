// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/image_content.dart';

class ServiceCategoryContent {
  int? id;
  String? name;
  String? description;
  bool? foodAndBeverage;
  bool? ordered;
  bool? status;
  ImageContent? image;

  ServiceCategoryContent({
    this.id,
    this.name,
    this.description,
    this.foodAndBeverage,
    this.ordered,
    this.status,
    this.image,
  });

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    foodAndBeverage = json['foodAndBeverage'];
    ordered = json['ordered'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['foodAndBeverage'] = this.foodAndBeverage;
    data['ordered'] = this.ordered;
    data['status'] = this.status;
    return data;
  }
}
