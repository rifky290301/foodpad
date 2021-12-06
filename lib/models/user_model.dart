// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.users,
  });

  List<UserElement>? users;

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class UserElement {
  UserElement({
    this.id,
    this.firstName,
    this.lastName,
    this.photo,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? photo;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        photo: json["photo"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "photo": photo,
        "email": email,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
