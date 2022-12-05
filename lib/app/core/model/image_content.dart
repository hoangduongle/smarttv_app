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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pictureType'] = pictureType;
    data['pictureDescription'] = pictureDescription;
    data['pictureUrl'] = pictureUrl;
    return data;
  }

  @override
  String toString() {
    return 'ImageContent(id: $id, pictureType: $pictureType, pictureDescription: $pictureDescription, pictureUrl: $pictureUrl)';
  }
}
