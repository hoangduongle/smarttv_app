// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ServiceCategoryContent {
  int? id;
  String? name;
  String? description;

  ServiceCategoryContent({this.id, this.name, this.description});

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;

    return data;
  }

  @override
  String toString() =>
      'ServiceCategoryContent(id: $id, name: $name, description: $description)';
}
