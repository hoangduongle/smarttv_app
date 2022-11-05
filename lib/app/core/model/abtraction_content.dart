class AbtractionContent {
  int? id;
  String? name;
  String? logtitude;
  String? latidute;
  String? openTime;
  String? closeTime;
  String? address;
  String? description;
  Hotel? hotel;

  AbtractionContent(
      {this.id,
      this.name,
      this.logtitude,
      this.latidute,
      this.openTime,
      this.closeTime,
      this.address,
      this.description,
      this.hotel});

  AbtractionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logtitude = json['logtitude'];
    latidute = json['latidute'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    address = json['address'];
    description = json['description'];
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logtitude'] = this.logtitude;
    data['latidute'] = this.latidute;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['address'] = this.address;
    data['description'] = this.description;
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AbtractionContent(id: $id, name: $name, logtitude: $logtitude, latidute: $latidute, openTime: $openTime, closeTime: $closeTime, address: $address, description: $description, hotel: $hotel)';
  }
}

class Hotel {
  int? id;
  String? shortName;
  String? fullName;
  String? phoneNumber;
  String? address;
  String? email;
  Null? website;
  Null? checkInTime;
  Null? checkOutTime;
  bool? breakfast;
  int? totalArea;
  int? totalRoom;
  Null? description;
  Null? longitude;
  Null? latitude;
  bool? status;
  Null? createDate;
  Null? updateDate;
  Null? createBy;
  Null? lastModifyBy;

  Hotel(
      {this.id,
      this.shortName,
      this.fullName,
      this.phoneNumber,
      this.address,
      this.email,
      this.website,
      this.checkInTime,
      this.checkOutTime,
      this.breakfast,
      this.totalArea,
      this.totalRoom,
      this.description,
      this.longitude,
      this.latitude,
      this.status,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortName = json['shortName'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    email = json['email'];
    website = json['website'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    breakfast = json['breakfast'];
    totalArea = json['totalArea'];
    totalRoom = json['totalRoom'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    status = json['status'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shortName'] = this.shortName;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['website'] = this.website;
    data['checkInTime'] = this.checkInTime;
    data['checkOutTime'] = this.checkOutTime;
    data['breakfast'] = this.breakfast;
    data['totalArea'] = this.totalArea;
    data['totalRoom'] = this.totalRoom;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['status'] = this.status;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    return data;
  }
}
