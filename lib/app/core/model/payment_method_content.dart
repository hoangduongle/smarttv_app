// ignore_for_file: unnecessary_this, prefer_collection_literals

class PaymentMethodContent {
  int? id;
  String? method;

  PaymentMethodContent({this.id, this.method});

  PaymentMethodContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['method'] = this.method;
    return data;
  }
}
