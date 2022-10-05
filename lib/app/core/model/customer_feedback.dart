import 'package:smarttv_app/app/core/model/feedback_content.dart';

class CustomerFeedback {
  String? id;
  String? bookingId;
  FeedbackContent? feedbackContent;
  double? rating;
  String? dateTime;
  CustomerFeedback({
    this.id,
    this.bookingId,
    this.feedbackContent,
    this.rating,
    this.dateTime,
  });
}
