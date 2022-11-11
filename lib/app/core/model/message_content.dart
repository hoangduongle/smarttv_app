// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:smarttv_app/app/core/model/booking_content.dart';

class MessageContent {
  int? id;
  String? messageContent;
  BookingContent? booking;

  MessageContent({this.id, this.messageContent, this.booking});

  MessageContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageContent = json['messageContent'];
    booking = json['booking'] != null
        ? BookingContent.fromJson(json['booking'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['messageContent'] = this.messageContent;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}
