// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  final String status;
  final String message;
  final User user;
  final Token token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user.toJson(),
        "token": token.toJson(),
      };
}

class Token {
  Token({
    required this.accessToken,
    required this.plainTextToken,
  });

  final AccessToken accessToken;
  final String plainTextToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: AccessToken.fromJson(json["accessToken"]),
        plainTextToken: json["plainTextToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken.toJson(),
        "plainTextToken": plainTextToken,
      };
}

class AccessToken {
  AccessToken({
    required this.name,
    required this.abilities,
    required this.tokenableId,
    required this.tokenableType,
    required this.id,
  });

  final String name;
  final List<String> abilities;
  final int tokenableId;
  final String tokenableType;
  final int id;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        name: json["name"],
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        tokenableId: json["tokenable_id"],
        tokenableType: json["tokenable_type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "tokenable_id": tokenableId,
        "tokenable_type": tokenableType,
        "id": id,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.profilePicture,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final dynamic emailVerifiedAt;
  final String profilePicture;
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "full_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_picture": profilePicture,
      };
}
