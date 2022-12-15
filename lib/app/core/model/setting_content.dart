class SettingContent {
  String? welcome;
  String? birthday;
  String? gender;
  String? wish1;
  String? wish2;

  SettingContent(
      {this.welcome, this.birthday, this.gender, this.wish1, this.wish2});

  SettingContent.fromJson(Map<String, dynamic> json) {
    welcome = json['welcome'];
    birthday = json['birthday'];
    gender = json['gender'];
    wish1 = json['wish1'];
    wish2 = json['wish2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['welcome'] = welcome;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['wish1'] = wish1;
    data['wish2'] = wish2;
    return data;
  }

  @override
  String toString() {
    return 'SettingContent(welcome: $welcome, birthday: $birthday, gender: $gender, wish1: $wish1, wish2: $wish2)';
  }
}
