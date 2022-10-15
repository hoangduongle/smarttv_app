// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class EventContent {
  int? id;
  String? name;
  String? ticketInformation;
  String? address;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  bool? status;
  int? numberOfView;

  EventContent(List<EventContent> result, {
    this.id,
    this.name,
    this.ticketInformation,
    this.address,
    this.description,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.status,
    this.numberOfView,
  });

  EventContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ticketInformation = json['ticketInformation'];
    address = json['address'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    status = json['status'];
    numberOfView = json['numberOfView'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ticketInformation'] = this.ticketInformation;
    data['address'] = this.address;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['numberOfView'] = this.numberOfView;

    return data;
  }
}
