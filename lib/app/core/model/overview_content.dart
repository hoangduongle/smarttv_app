class OverviewContent {
  OverviewContent({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
  });

  int? id;
  String? title;
  String? imageUrl;
  String? description;

  factory OverviewContent.fromJson(Map<String, dynamic> json) =>
      OverviewContent(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "description": description,
      };
}
