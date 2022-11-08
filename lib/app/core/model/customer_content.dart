// ignore_for_file: prefer_collection_literals, unnecessary_this

class CustomerContent {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  int? gender;
  String? phoneNumber;
  String? email;
  int? idNo;
  int? passportNo;
  String? birthDate;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;

  CustomerContent(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.phoneNumber,
      this.email,
      this.idNo,
      this.passportNo,
      this.birthDate,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy});

  CustomerContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    idNo = json['idNo'];
    passportNo = json['passportNo'];
    birthDate = json['birthDate'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['idNo'] = this.idNo;
    data['passportNo'] = this.passportNo;
    data['birthDate'] = this.birthDate;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    return data;
  }
}
