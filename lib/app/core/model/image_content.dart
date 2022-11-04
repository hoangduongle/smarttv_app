class ImageContent {
  int? id;
  String? pictureType;
  String? pictureDescription;
  String? pictureUrl;

  ImageContent(
      {this.id, this.pictureType, this.pictureDescription, this.pictureUrl});

  ImageContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pictureType = json['pictureType'];
    pictureDescription = json['pictureDescription'];
    pictureUrl = json['pictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pictureType'] = this.pictureType;
    data['pictureDescription'] = this.pictureDescription;
    data['pictureUrl'] = this.pictureUrl;
    return data;
  }
}
