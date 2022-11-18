// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/feedback_content.dart';

class CustomerFeedback {
  int? id;
  BookingContent? booking;
  FeedbackContent? feedbackContent;
  int? rating;
  String? dateTime;

  CustomerFeedback(
      {this.id,
      this.booking,
      this.feedbackContent,
      this.rating,
      this.dateTime});

  CustomerFeedback.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    booking = json['booking'] != null
        ? BookingContent.fromJson(json['booking'])
        : null;
    feedbackContent = json['feedbackContent'] != null
        ? FeedbackContent.fromJson(json['feedbackContent'])
        : null;
    rating = json['rating'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['booking_Id'] = this.booking!.id;
    data['dateTime'] = this.dateTime;
    data['feedbackContent_Id'] = this.feedbackContent!.id;
    data['id'] = this.id;
    data['rating'] = this.rating;
    return data;
  }

  @override
  String toString() {
    return 'CustomerFeedback(id: $id, booking: $booking, feedbackContent: $feedbackContent, rating: $rating, dateTime: $dateTime)';
  }
}
