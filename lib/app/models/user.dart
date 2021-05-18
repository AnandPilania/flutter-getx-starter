class User {
  late int id;
  late String name;
  late String email;
  late bool isVerified;
  late bool isActive;
  late bool isBanned;
  late String type;
  late String token;
  late DateTime createdAt;
  late DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isVerified,
    required this.isActive,
    required this.isBanned,
    required this.type,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    isBanned = json['isBanned'];
    type = json['type'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['isVerified'] = isVerified;
    data['isActive'] = isActive;
    data['isBanned'] = isBanned;
    data['type'] = type;
    data['createdAt'] = createdAt.toString();
    data['updatedAt'] = updatedAt.toString();
    return data;
  }
}
