// ignore_for_file: unnecessary_this, prefer_collection_literals

class OrderRequest {
  int? bookingId;
  String? createBy;
  String? createDate;
  int? id;
  String? lastModifyBy;
  List<LorderDetailRequests>? lorderDetailRequests;
  int? orderPaymentId;
  String? status;
  double? totalAmount;
  String? updateDate;

  OrderRequest(
      {this.bookingId,
      this.createBy,
      this.createDate,
      this.id,
      this.lastModifyBy,
      this.lorderDetailRequests,
      this.orderPaymentId,
      this.status,
      this.totalAmount,
      this.updateDate});

  OrderRequest.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_Id'];
    createBy = json['createBy'];
    createDate = json['createDate'];
    id = json['id'];
    lastModifyBy = json['lastModifyBy'];
    if (json['lorderDetailRequests'] != null) {
      lorderDetailRequests = <LorderDetailRequests>[];
      json['lorderDetailRequests'].forEach((v) {
        lorderDetailRequests!.add(LorderDetailRequests.fromJson(v));
      });
    }
    orderPaymentId = json['orderPayment_Id'];
    status = json['status'];
    totalAmount = json['totalAmount'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['booking_Id'] = this.bookingId;
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['id'] = this.id;
    data['lastModifyBy'] = this.lastModifyBy;
    if (this.lorderDetailRequests != null) {
      data['lorderDetailRequests'] =
          this.lorderDetailRequests!.map((v) => v.toJson()).toList();
    }
    data['orderPayment_Id'] = this.orderPaymentId;
    data['status'] = this.status;
    data['totalAmount'] = this.totalAmount;
    data['updateDate'] = this.updateDate;
    return data;
  }
}

class LorderDetailRequests {
  double? amount;
  int? id;
  String? orderDate;
  int? orderId;
  double? price;
  int? quantity;
  int? serviceId;

  LorderDetailRequests(
      {this.amount,
      this.id,
      this.orderDate,
      this.orderId,
      this.price,
      this.quantity,
      this.serviceId});

  LorderDetailRequests.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    id = json['id'];
    orderDate = json['orderDate'];
    orderId = json['order_Id'];
    price = json['price'];
    quantity = json['quantity'];
    serviceId = json['service_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['id'] = this.id;
    data['orderDate'] = this.orderDate;
    data['order_Id'] = this.orderId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['service_Id'] = this.serviceId;
    return data;
  }
}
