import 'package:meta/meta.dart';
import 'dart:convert';

RatingResult RatingResultFromJson(String str) =>
    RatingResult.fromJson(json.decode(str));
String RatingResultToJson(RatingResult data) => json.encode(data.toJson());

class RatingResult {
  RatingResult({
    required this.rating,
  });

  final List<Rating> rating;

  factory RatingResult.fromJson(Map<String, dynamic> json) => RatingResult(
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
      };
}

class Rating {
  Rating({
    required this.id,
    required this.rating,
    required this.review,
    required this.recipeId,
    required this.userId,
  });

  final int id;
  final int rating;
  final String review;
  final int recipeId;
  final int userId;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        rating: json["rating"],
        review: json["review"],
        recipeId: json["recipe_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "review": review,
        "recipe_id": recipeId,
        "user_id": userId,
      };
}
