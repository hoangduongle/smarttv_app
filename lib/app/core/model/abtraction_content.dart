// ignore_for_file: unnecessary_this, prefer_collection_literals

class AbtractionContent {
  int? id;
  String? name;
  double? longtitude;
  double? latidute;
  String? openTime;
  String? closeTime;
  String? address;
  String? description;

  AbtractionContent({
    this.id,
    this.name,
    this.longtitude,
    this.latidute,
    this.openTime,
    this.closeTime,
    this.address,
    this.description,
  });

  AbtractionContent.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['longtitude'] = this.longtitude;
    data['latidute'] = this.latidute;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}
