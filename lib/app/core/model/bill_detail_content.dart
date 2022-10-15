// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class BillDetailContent {
  int? id;
  int? serviceId;
  int? billId;
  int? quantity;
  double? price;
  double? amount;
  int? status;

  BillDetailContent(
      {this.id,
      this.serviceId,
      this.billId,
      this.quantity,
      this.price,
      this.amount,
      this.status});

  BillDetailContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_Id'];
    billId = json['bill_Id'];
    quantity = json['quantity'];
    price = json['price'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_Id'] = this.serviceId;
    data['bill_Id'] = this.billId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['status'] = this.status;
    return data;
  }
}
