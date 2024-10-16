import 'dart:convert';

class Users {
  String address;
  String id;
  String userId;
  String name;
  String photo;
  String emailId;
  String password;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  int v;
  String? role;

  Users({
    required this.address,
    required this.id,
    required this.userId,
    required this.name,
    required this.photo,
    required this.emailId,
    required this.password,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.v,
    this.role,
  });

  factory Users.fromRawJson(String str) => Users.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        address: json["address"],
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        photo: json["photo"],
        emailId: json["emailId"],
        password: json["password"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        v: json["__v"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "_id": id,
        "userId": userId,
        "name": name,
        "photo": photo,
        "emailId": emailId,
        "password": password,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "__v": v,
        "role": role,
      };
}
