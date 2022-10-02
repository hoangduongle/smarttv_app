// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ServiceContent {
  String? categoryId;
  double? price;
  String? name;
  String? description;
  String? id;
  String? picture;
  bool? status;

  ServiceContent(
      {this.categoryId,
      this.price,
      this.name,
      this.description,
      this.id,
      this.picture,
      this.status});

  ServiceContent.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    id = json['id'];
    picture = json['picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    data['picture'] = this.picture;
    data['status'] = this.status;
    return data;
  }
}
