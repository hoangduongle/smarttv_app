// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ServiceCategoryContent {
  int? id;
  String? name;
  String? description;
  bool? status;


  ServiceCategoryContent(
      {this.id, this.name, this.description, this.status});

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}
