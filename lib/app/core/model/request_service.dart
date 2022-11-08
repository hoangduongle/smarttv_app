import 'package:smarttv_app/app/core/model/booking_content.dart';

class RequestServiceContent {
  int? id;
  String? requestServiceName;
  String? requestServiceType;
  String? dateTime;
  String? status;
  BookingContent? booking;

  RequestServiceContent(
      {this.id,
      this.requestServiceName,
      this.requestServiceType,
      this.dateTime,
      this.status,
      this.booking});

  RequestServiceContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestServiceName = json['requestServiceName'];
    requestServiceType = json['requestServiceType'];
    dateTime = json['dateTime'];
    status = json['status'];
    booking =
        json['booking'] != null ? new BookingContent.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestServiceName'] = this.requestServiceName;
    data['requestServiceType'] = this.requestServiceType;
    data['dateTime'] = this.dateTime;
    data['status'] = this.status;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}