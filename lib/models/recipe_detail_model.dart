// To parse this JSON data, do
//
//     final recipeDetail = recipeDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RecipeDetail recipeDetailFromJson(String str) =>
    RecipeDetail.fromJson(json.decode(str));

String recipeDetailToJson(RecipeDetail data) => json.encode(data.toJson());

class RecipeDetail {
  RecipeDetail({
    required this.data,
  });

  final List<Detail> data;

  factory RecipeDetail.fromJson(Map<String, dynamic> json) => RecipeDetail(
        data: List<Detail>.from(json["data"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.prepare,
    required this.duration,
    required this.description,
    required this.level,
    required this.author,
    required this.ratings,
    required this.steps,
    required this.ingredients,
    required this.categories,
  });

  final int id;
  final String name;
  final String thumbnail;
  final int prepare;
  final int duration;
  final String description;
  final String level;
  final Author author;
  final List<Rating> ratings;
  final List<Steps> steps;
  final List<Ingredient> ingredients;
  final List<Categories> categories;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        prepare: json["prepare"],
        duration: json["duration"],
        description: json["description"],
        level: json["level"],
        author: Author.fromJson(json["author"]),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        steps: List<Steps>.from(json["steps"].map((x) => Steps.fromJson(x))),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        categories: List<Categories>.from(
            json["categories"].map((x) => Categories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "prepare": prepare,
        "duration": duration,
        "description": description,
        "level": level,
        "author": author.toJson(),
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Author {
  Author({
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

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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

class Categories {
  Categories({
    required this.category,
  });

  final String category;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
      };
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Rating {
  Rating({
    required this.rating,
    required this.review,
    required this.reviewer,
  });

  final int rating;
  final String review;
  final Author reviewer;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"],
        review: json["review"],
        reviewer: Author.fromJson(json["reviewer"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "review": review,
        "reviewer": reviewer.toJson(),
      };
}

class Steps {
  Steps({
    required this.step,
  });

  final String step;

  factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        step: json["step"],
      );

  Map<String, dynamic> toJson() => {
        "step": step,
      };
}
