// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';

class ServiceContent {
  int? id;
  String? name;
  double? price;
  String? description;
  bool? status;
  String? majorGroup;
  List<ImageContent>? image;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;
  ServiceCategoryContent? serviceCategory;

  ServiceContent(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.status,
      this.majorGroup,
      this.image,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy,
      this.serviceCategory});

  ServiceContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    majorGroup = json['majorGroup'];
    if (json['image'] != null) {
      image = <ImageContent>[];
      json['image'].forEach((v) {
        image!.add(ImageContent.fromJson(v));
      });
    }
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
    serviceCategory = json['serviceCategory'] != null
        ? ServiceCategoryContent.fromJson(json['serviceCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['status'] = this.status;
    data['majorGroup'] = this.majorGroup;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    if (this.serviceCategory != null) {
      data['serviceCategory'] = this.serviceCategory!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ServiceContent(id: $id, name: $name, price: $price, description: $description, status: $status, majorGroup: $majorGroup, image: $image, createDate: $createDate, updateDate: $updateDate, createBy: $createBy, lastModifyBy: $lastModifyBy, serviceCategory: $serviceCategory)';
  }
}
