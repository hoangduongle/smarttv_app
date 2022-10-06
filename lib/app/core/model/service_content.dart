// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

import 'package:smarttv_app/app/core/model/service_category_content.dart';

class ServiceContent {
  int? id;
  String? name;
  String? picture;
  double? price;
  String? description;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? updateBy;
  ServiceCategoryContent? serviceCategory;
  bool? external;

  ServiceContent(
      {this.id,
      this.name,
      this.picture,
      this.price,
      this.description,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.updateBy,
      this.serviceCategory,
      this.external});

  ServiceContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    price = json['price'];
    description = json['description'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    serviceCategory = json['serviceCategory'] != null
        ? new ServiceCategoryContent.fromJson(json['serviceCategory'])
        : null;
    external = json['external'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['price'] = this.price;
    data['description'] = this.description;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['updateBy'] = this.updateBy;
    if (this.serviceCategory != null) {
      data['serviceCategory'] = this.serviceCategory!.toJson();
    }
    data['external'] = this.external;
    return data;
  }
}
