// ignore_for_file: unnecessary_this, prefer_collection_literals

class MomoContent {
  String? partnerCode;
  String? orderId;
  String? requestId;
  int? amount;
  String? responseTime;
  String? message;
  int? resultCode;
  String? payUrl;
  String? deeplink;
  String? qrCodeUrl;
  String? deeplinkMiniApp;

  MomoContent(
      {this.partnerCode,
      this.orderId,
      this.requestId,
      this.amount,
      this.responseTime,
      this.message,
      this.resultCode,
      this.payUrl,
      this.deeplink,
      this.qrCodeUrl,
      this.deeplinkMiniApp});

  MomoContent.fromJson(Map<String, dynamic> json) {
    partnerCode = json['partnerCode'];
    orderId = json['orderId'];
    requestId = json['requestId'];
    amount = json['amount'];
    responseTime = json['responseTime'];
    message = json['message'];
    resultCode = json['resultCode'];
    payUrl = json['payUrl'];
    deeplink = json['deeplink'];
    qrCodeUrl = json['qrCodeUrl'];
    deeplinkMiniApp = json['deeplinkMiniApp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['partnerCode'] = this.partnerCode;
    data['orderId'] = this.orderId;
    data['requestId'] = this.requestId;
    data['amount'] = this.amount;
    data['responseTime'] = this.responseTime;
    data['message'] = this.message;
    data['resultCode'] = this.resultCode;
    data['payUrl'] = this.payUrl;
    data['deeplink'] = this.deeplink;
    data['qrCodeUrl'] = this.qrCodeUrl;
    data['deeplinkMiniApp'] = this.deeplinkMiniApp;
    return data;
  }
}
