// ignore_for_file: unnecessary_this, prefer_collection_literals

class VNPayContent {
  String? code;
  String? message;
  String? url;

  VNPayContent({this.code, this.message, this.url});

  VNPayContent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['url'] = this.url;
    return data;
  }
}
