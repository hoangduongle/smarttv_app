import 'package:smarttv_app/app/core/model/room_content.dart';

class DeviceContent {
  int? id;
  String? partNumber;
  String? serialNo;
  String? name;
  String? brand;
  String? description;
  bool? status;
  RoomContent? room;

  DeviceContent(
      {this.id,
      this.partNumber,
      this.serialNo,
      this.name,
      this.brand,
      this.description,
      this.status,
      this.room});

  DeviceContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partNumber = json['partNumber'];
    serialNo = json['serialNo'];
    name = json['name'];
    brand = json['brand'];
    description = json['description'];
    status = json['status'];
    room = json['room'] != null ? new RoomContent.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partNumber'] = this.partNumber;
    data['serialNo'] = this.serialNo;
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    return data;
  }
}
