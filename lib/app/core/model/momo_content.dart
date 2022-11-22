// ignore_for_file: prefer_collection_literals, unnecessary_this

class MomoContent {
  int? amount;
  String? deeplink;
  String? deeplinkMiniApp;
  String? message;
  String? orderId;
  String? partnerCode;
  String? payUrl;
  String? qrCodeUrl;
  String? requestId;
  String? responseTime;
  int? resultCode;

  MomoContent(
      {this.amount,
      this.deeplink,
      this.deeplinkMiniApp,
      this.message,
      this.orderId,
      this.partnerCode,
      this.payUrl,
      this.qrCodeUrl,
      this.requestId,
      this.responseTime,
      this.resultCode});

  MomoContent.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    deeplink = json['deeplink'];
    deeplinkMiniApp = json['deeplinkMiniApp'];
    message = json['message'];
    orderId = json['orderId'];
    partnerCode = json['partnerCode'];
    payUrl = json['payUrl'];
    qrCodeUrl = json['qrCodeUrl'];
    requestId = json['requestId'];
    responseTime = json['responseTime'];
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['deeplink'] = this.deeplink;
    data['deeplinkMiniApp'] = this.deeplinkMiniApp;
    data['message'] = this.message;
    data['orderId'] = this.orderId;
    data['partnerCode'] = this.partnerCode;
    data['payUrl'] = this.payUrl;
    data['qrCodeUrl'] = this.qrCodeUrl;
    data['requestId'] = this.requestId;
    data['responseTime'] = this.responseTime;
    data['resultCode'] = this.resultCode;
    return data;
  }

  @override
  String toString() {
    return 'MomoContent(amount: $amount, deeplink: $deeplink, deeplinkMiniApp: $deeplinkMiniApp, message: $message, orderId: $orderId, partnerCode: $partnerCode, payUrl: $payUrl, qrCodeUrl: $qrCodeUrl, requestId: $requestId, responseTime: $responseTime, resultCode: $resultCode)';
  }
}
