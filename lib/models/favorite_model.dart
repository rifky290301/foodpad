// To parse this JSON data, do
//
//     final favoriteResult = favoriteResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FavoriteResult favoriteResultFromJson(String str) =>
    FavoriteResult.fromJson(json.decode(str));

String favoriteResultToJson(FavoriteResult data) => json.encode(data.toJson());

class FavoriteResult {
  FavoriteResult({
    required this.favorite,
  });

  List<Favorite> favorite;

  factory FavoriteResult.fromJson(Map<String, dynamic> json) => FavoriteResult(
        favorite: List<Favorite>.from(
            json["favorite"].map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favorite": List<dynamic>.from(favorite.map((x) => x.toJson())),
      };
}

class Favorite {
  Favorite({
    required this.id,
    required this.recipeId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.recipe,
  });

  int id;
  int recipeId;
  int userId;
  dynamic createdAt;
  dynamic updatedAt;
  Recipe recipe;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        recipeId: json["recipe_id"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        recipe: Recipe.fromJson(json["recipe"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe_id": recipeId,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "recipe": recipe.toJson(),
      };
}

class Recipe {
  Recipe({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.prepare,
    required this.duration,
    required this.level,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    required this.ratings,
    required this.steps,
    required this.ingredients,
    required this.categories,
  });

  int id;
  String name;
  String thumbnail;
  String description;
  int prepare;
  int duration;
  String level;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  Author author;
  List<Rating> ratings;
  List<dynamic> steps;
  List<Ingredient> ingredients;
  List<CategoryElement> categories;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        prepare: json["prepare"],
        duration: json["duration"],
        level: json["level"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        author: Author.fromJson(json["author"]),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "description": description,
        "prepare": prepare,
        "duration": duration,
        "level": level,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "author": author.toJson(),
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "steps": List<dynamic>.from(steps.map((x) => x)),
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
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String photo;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class CategoryElement {
  CategoryElement({
    required this.id,
    required this.recipeId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  int id;
  int recipeId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  CategoryCategory category;

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        id: json["id"],
        recipeId: json["recipe_id"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe_id": recipeId,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

class CategoryCategory {
  CategoryCategory({
    required this.id,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryCategory.fromJson(Map<String, dynamic> json) =>
      CategoryCategory(
        id: json["id"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Ingredient {
  Ingredient({
    required this.id,
    required this.name,
    required this.value,
    required this.recipeId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String value;
  int recipeId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        recipeId: json["recipe_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "recipe_id": recipeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Rating {
  Rating({
    required this.id,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.recipeId,
    required this.userId,
  });

  int id;
  int rating;
  String review;
  DateTime createdAt;
  DateTime updatedAt;
  int recipeId;
  int userId;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        rating: json["rating"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        recipeId: json["recipe_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "review": review,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "recipe_id": recipeId,
        "user_id": userId,
      };
}
