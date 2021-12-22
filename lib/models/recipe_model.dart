import 'dart:convert';

RecipeResult recipeResultFromJson(String str) =>
    RecipeResult.fromJson(json.decode(str));

String recipeResultToJson(RecipeResult data) => json.encode(data.toJson());

class RecipeResult {
  RecipeResult({
    required this.data,
  });

  final List<Datum> data;

  factory RecipeResult.fromJson(Map<String, dynamic> json) => RecipeResult(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.duration,
    required this.level,
    required this.rating,
  });

  final int id;
  final String name;
  final String thumbnail;
  final int duration;
  final String level;
  final String rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        duration: json["duration"],
        level: json["level"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "duration": duration,
        "level": level,
        "rating": rating,
      };
}
