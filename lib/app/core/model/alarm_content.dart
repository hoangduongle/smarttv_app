// ignore_for_file: prefer_collection_literals, unnecessary_this

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
        ? BookingContent.fromJson(json['booking'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AlarmContent(id: $id, date: $date, booking: $booking, status: $status)';
  }
}
