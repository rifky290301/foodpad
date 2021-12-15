import 'dart:convert';

FavoriteResult favoriteResultFromJson(String str) =>
    FavoriteResult.fromJson(json.decode(str));

String favoriteResultToJson(FavoriteResult data) => json.encode(data.toJson());

class FavoriteResult {
  FavoriteResult({
    this.data,
  });

  List<Datum>? data;

  factory FavoriteResult.fromJson(Map<String, dynamic> json) => FavoriteResult(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.recipeId,
    this.userId,
    this.name,
    this.thumbnail,
    this.duration,
    this.level,
    this.rating,
  });

  int? id;
  int? recipeId;
  int? userId;
  String? name;
  String? thumbnail;
  int? duration;
  String? level;
  String? rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        recipeId: json["recipe_id"],
        userId: json["user_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        duration: json["duration"],
        level: json["level"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe_id": recipeId,
        "user_id": userId,
        "name": name,
        "thumbnail": thumbnail,
        "duration": duration,
        "level": level,
        "rating": rating,
      };
}
