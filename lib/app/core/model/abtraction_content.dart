// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class AbtractionContent {
  int? id;
  String? name;
  String? openTime;
  String? closeTime;
  String? address;
  String? description;

  AbtractionContent({
    this.id,
    this.name,
    this.openTime,
    this.closeTime,
    this.address,
    this.description,
  });

  AbtractionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['address'] = this.address;
    data['description'] = this.description;

    return data;
  }

  @override
  String toString() {
    return 'AbtractionContent(id: $id, name: $name, openTime: $openTime, closeTime: $closeTime, address: $address, description: $description)';
  }
}
