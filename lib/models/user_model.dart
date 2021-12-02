import 'package:meta/meta.dart';
import 'dart:convert';

UserResult UserResultFromJson(String str) =>
    UserResult.fromJson(json.decode(str));

String UserResultToJson(UserResult data) => json.encode(data.toJson());

class UserResult {
  UserResult({
    required this.users,
  });

  final List<User> users;

  factory UserResult.fromJson(Map<String, dynamic> json) => UserResult(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.photo,
    required this.email,
  });

  final int id;
  final String name;
  final String photo;
  final String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        photo: json["photo"] == null ? null : json["photo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo == null ? null : photo,
        "email": email,
      };
}
