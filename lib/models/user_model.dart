// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.users,
  });

  final List<UserElement> users;

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class UserElement {
  UserElement({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.email,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final String email;

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        photo: json["photo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "photo": photo,
        "email": email,
      };
}
