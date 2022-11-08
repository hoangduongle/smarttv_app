// ignore_for_file: unnecessary_this, prefer_collection_literals

class OrderContent {
  int? id;
  double? totalAmount;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;

  OrderContent(
      {this.id,
      this.totalAmount,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy});

  OrderContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['totalAmount'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
    lastModifyBy = json['lastModifyBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['totalAmount'] = this.totalAmount;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    data['lastModifyBy'] = this.lastModifyBy;
    return data;
  }

  @override
  String toString() {
    return 'OrderContent(id: $id, totalAmount: $totalAmount, createDate: $createDate, updateDate: $updateDate, createBy: $createBy, lastModifyBy: $lastModifyBy)';
  }
}
