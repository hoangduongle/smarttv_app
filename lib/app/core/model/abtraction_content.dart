import 'package:smarttv_app/app/core/model/image_content.dart';

class AbstractionsContent {
  int? id;
  String? name;
  double? longtitude;
  double? latidute;
  String? openTime;
  String? closeTime;
  String? address;
  String? description;
  ImageContent? image;

  AbstractionsContent(
      {this.id,
      this.name,
      this.longtitude,
      this.latidute,
      this.openTime,
      this.closeTime,
      this.address,
      this.description,
      this.image});

  AbstractionsContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    longtitude = json['longtitude'];
    latidute = json['latidute'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['longtitude'] = longtitude;
    data['latidute'] = latidute;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    data['address'] = address;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'AbtractionContent(id: $id, name: $name, longtitude: $longtitude, latidute: $latidute, openTime: $openTime, closeTime: $closeTime, address: $address, description: $description,images: $image)';
  }
}
