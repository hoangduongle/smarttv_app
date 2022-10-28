class RoomContent {
  int? id;
  String? name;
  String? roomNo;
  String? description;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;
  int? hotelId;
  int? roomTypeId;

  RoomContent(
      {this.id,
      this.name,
      this.roomNo,
      this.description,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy,
      this.hotelId,
      this.roomTypeId});

  RoomContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roomNo = json['roomNo'];
    description = json['description'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
    hotelId = json['hotel_Id'];
    roomTypeId = json['roomType_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['roomNo'] = this.roomNo;
    data['description'] = this.description;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    data['hotel_Id'] = this.hotelId;
    data['roomType_Id'] = this.roomTypeId;
    return data;
  }
}
