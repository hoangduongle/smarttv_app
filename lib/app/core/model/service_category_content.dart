// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals
class ServiceCategoryContent {
  String? id;
  String? name;
  String? picture;
  String? description;

  ServiceCategoryContent({this.id, this.name, this.picture, this.description});

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['description'] = this.description;
    return data;
  }
}
