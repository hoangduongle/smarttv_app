// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class PromotionContent {
  int? id;
  String? name;
  String? description;
  String? detailInformation;
  String? startDate;
  String? endDate;

  PromotionContent({
    this.id,
    this.name,
    this.description,
    this.detailInformation,
    this.startDate,
    this.endDate,
  });

  PromotionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    detailInformation = json['detailInformation'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['detailInformation'] = this.detailInformation;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;

    return data;
  }
}
