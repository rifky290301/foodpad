// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.user,
    this.token,
  });

  String? status;
  String? message;
  User? user;
  Token? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
        "token": token?.toJson(),
      };
}

class Token {
  Token({
    this.accessToken,
    this.plainTextToken,
  });

  AccessToken? accessToken;
  String? plainTextToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: AccessToken.fromJson(json["accessToken"]),
        plainTextToken: json["plainTextToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken?.toJson(),
        "plainTextToken": plainTextToken,
      };
}

class AccessToken {
  AccessToken({
    this.name,
    this.abilities,
    this.tokenableId,
    this.tokenableType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  List<String>? abilities;
  int? tokenableId;
  String? tokenableType;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        name: json["name"],
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        tokenableId: json["tokenable_id"],
        tokenableType: json["tokenable_type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "abilities": List<dynamic>.from(abilities!.map((x) => x)),
        "tokenable_id": tokenableId,
        "tokenable_type": tokenableType,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic? emailVerifiedAt;
  String? profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "full_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_picture": profilePicture,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
