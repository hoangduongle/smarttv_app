// ignore_for_file: prefer_collection_literals, unnecessary_this

class FeedbackContent {
  int? id;
  String? content;

  FeedbackContent({this.id, this.content});

  FeedbackContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    return data;
  }

  @override
  String toString() => 'FeedbackContent(id: $id, content: $content)';
}
