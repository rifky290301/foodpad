import 'dart:convert';

RecipeResult recipeResultFromJson(String str) =>
    RecipeResult.fromJson(json.decode(str));
String recipeResultToJson(RecipeResult data) => json.encode(data.toJson());

class RecipeResult {
  RecipeResult({
    required this.recipes,
  });

  final List<Recipe> recipes;

  factory RecipeResult.fromJson(Map<String, dynamic> json) => RecipeResult(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
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
    required this.author,
    required this.ratings,
    required this.steps,
    required this.ingredients,
    required this.categories,
  });

  final int id;
  final String name;
  final String thumbnail;
  final String description;
  final int prepare;
  final int duration;
  final String level;
  final int userId;

  final Author author;
  final List<Rating> ratings;
  final List<Step> steps;
  final List<Ingredient> ingredients;
  final List<CategoryResult> categories;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        prepare: json["prepare"],
        duration: json["duration"],
        level: json["level"],
        userId: json["user_id"],
        author: Author.fromJson(json["author"]),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        categories: List<CategoryResult>.from(
            json["categories"].map((x) => CategoryResult.fromJson(x))),
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
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

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

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.recipeId,
    required this.categoryId,
    required this.category,
  });

  final int id;
  final int recipeId;
  final int categoryId;

  final Categories category;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        id: json["id"],
        recipeId: json["recipe_id"],
        categoryId: json["category_id"],
        category: Categories.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe_id": recipeId,
        "category_id": categoryId,
        "category": category.toJson(),
      };
}

class Categories {
  Categories({
    required this.id,
    required this.category,
  });

  final int id;
  final String category;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
      };
}

class Ingredient {
  Ingredient({
    required this.id,
    required this.name,
    required this.value,
    required this.recipeId,
  });

  final int id;
  final String name;
  final String value;
  final int recipeId;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        recipeId: json["recipe_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "recipe_id": recipeId,
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

class Step {
  Step({
    required this.id,
    required this.step,
    required this.recipeId,
  });

  final int id;
  final String step;
  final int recipeId;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        id: json["id"],
        step: json["step"],
        recipeId: json["recipe_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "step": step,
        "recipe_id": recipeId,
      };
}
