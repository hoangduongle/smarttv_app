// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class ServiceCategoryContent {
  int? id;
  String? name;
  String? description;
  bool? status;

  bool? foodAndBeverage;

  ServiceCategoryContent(
      {this.id,
      this.name,
      this.description,
      this.status,
      this.foodAndBeverage});

  ServiceCategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];

    foodAndBeverage = json['foodAndBeverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;

    data['foodAndBeverage'] = this.foodAndBeverage;
    return data;
  }

  @override
  String toString() {
    return 'ServiceCategoryContent(id: $id, name: $name, description: $description, status: $status, foodAndBeverage: $foodAndBeverage)';
  }
}
