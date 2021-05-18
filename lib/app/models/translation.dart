class Translation {
  late String key;
  late String value;

  Translation({required this.key, required this.value});

  Translation.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    key = json['value'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
