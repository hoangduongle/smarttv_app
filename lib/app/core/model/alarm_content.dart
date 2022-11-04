import 'package:smarttv_app/app/core/model/booking_content.dart';

class AlarmContent {
  int? id;
  String? date;
  BookingContent? booking;
  bool? status;

  AlarmContent({
    this.id,
    this.date,
    this.booking,
    this.status,
  });

  AlarmContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    date = json['date'];
    booking = json['booking'] != null
        ? new BookingContent.fromJson(json['booking'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}
