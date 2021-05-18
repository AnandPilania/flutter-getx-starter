class Slide {
  late String title;
  late String subTitle;
  late String image;
  late bool isSvg;
  late bool? isLocal;

  Slide({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.isSvg,
    this.isLocal,
  });

  Slide.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    image = json['image'];
    isSvg = json['isSvg'];
    isLocal = json['isLocal'] ?? false;
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['image'] = image;
    data['isSvg'] = isSvg;
    data['isLocal'] = isLocal;
    return data;
  }
}
