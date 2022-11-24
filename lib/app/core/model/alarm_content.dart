// ignore_for_file: prefer_collection_literals, unnecessary_this

class AlarmContent {
  int? id;
  String? dateTime;
  bool? status;
  int? bookingId;

  AlarmContent({this.id, this.dateTime, this.status, this.bookingId});

  AlarmContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['dateTime'];
    status = json['status'];
    bookingId = json['booking_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['dateTime'] = this.dateTime;
    data['status'] = this.status;
    data['booking_id'] = this.bookingId;
    return data;
  }

  @override
  String toString() {
    return 'AlarmContent(id: $id, dateTime: $dateTime, status: $status, bookingId: $bookingId)';
  }
}
