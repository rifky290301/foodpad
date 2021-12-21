import 'dart:convert';
import 'package:foodpad/models/category_model.dart';
import 'package:foodpad/models/favorite_model.dart';
import 'package:foodpad/models/login_model.dart';
// import 'package:foodpad/models/rating_model.dart';
import 'package:foodpad/models/recipe2_model.dart';
import 'package:foodpad/models/recipe_detail_model.dart';
import 'package:foodpad/models/report_model.dart';
// import 'package:foodpad/models/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'http://api-foodpad.herokuapp.com/api/';
  static const String recipe = _baseUrl + 'recipe';
  static const String recipe2 = _baseUrl + 'recipe2';
  static const String login = _baseUrl + 'login';
  static const String register = _baseUrl + 'register';
  static const String logout = _baseUrl + 'logout';
  static const String detail = _baseUrl + 'recipe/';
  static const String detail2 = _baseUrl + 'recipe2/';
  static const String rating = _baseUrl + 'rating';
  static const String profilePic = _baseUrl + 'user/photo-profile/';
  static const String category = _baseUrl + 'category2';
  static const String favorite2 = _baseUrl + 'favorite2/';
  static const String favorite = _baseUrl + 'favorite/';
  static const String search = _baseUrl + 'search/';
  static const String trending = _baseUrl + 'trending2';
  static const String sementara = _baseUrl + 'sementara';
  static const String recipeCategory = _baseUrl + 'recipe-category/';
  static const String review = _baseUrl + 'rating';
  static const String report = _baseUrl + 'report';
  static const String lastIdRecipe = _baseUrl + 'last-recipe-create';

  Future<Recipe2Result> ingredientRecipeList(query) async {
    final response = await http.get(Uri.parse(search + query!));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Recipe2Result> recipeList2(query) async {
    String? request;
    if (query == null || query == '') {
      request = recipe2;
    } else {
      request = search + query;
    }
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Recipe2Result> trendingList() async {
    final response = await http.get(Uri.parse(trending));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<RecipeDetail> recipeDetail2(String id) async {
    final response = await http.get(Uri.parse(detail2 + id));

    if (response.statusCode == 200) {
      return RecipeDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Recipe2Result> recipeShorting(String shorting) async {
    final response = await http.get(Uri.parse(recipeCategory + shorting));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  static Future<String> addRecipe(
    String name,
    String thumbnail,
    String description,
    prepare,
    duration,
    String level,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    try {
      final response = await http.post(
        Uri.parse(recipe),
        headers: {'Accept': 'application/json'},
        body: {
          "name": name,
          "thumbnail": thumbnail,
          "description": description,
          "prepare": prepare,
          "duration": duration,
          "level": level,
          "user_id": idUser,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add recipe");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Recipe2Result> lastRecipe() async {
    final response = await http.get(Uri.parse(lastIdRecipe));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Category2> categoryList() async {
    final response = await http.get(Uri.parse(category));

    if (response.statusCode == 200) {
      return Category2.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<FavoriteResult> favoriteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    final response = await http.get(Uri.parse(favorite2 + idUser));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan favorit');
    }
  }

  Future<FavoriteResult> favoriteCheck(String idRecipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();

    final response =
        await http.get(Uri.parse(favorite + idRecipe + '/' + idUser));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<String> deleteFovorite(String idFavorite) async {
    try {
      final response = await http.delete(Uri.parse(favorite + idFavorite));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed delete favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  Future<String> deleteFovorite2(String idFavorite) async {
    try {
      final response = await http.delete(Uri.parse(favorite + idFavorite));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed delete favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  Future<String> addFavorite(String idRecipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + 'favorite'),
        headers: {'Accept': 'application/json'},
        body: {
          "recipe_id": idRecipe,
          "user_id": idUser,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<LoginModel> reqLogin(email, password) async {
    try {
      var response = await http
          .post(Uri.parse(login), body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        return LoginModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<String?> destroyLogout(String token) async {
    try {
      final response =
          await http.post(Uri.parse(logout), body: {'token': token});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<String> userRegister(
      String firstName, String lastName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(register),
        headers: {'Accept': 'application/json'},
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed regsiter user");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  Future<String> addReview(
      String recipeId, String rating, String reviewRecipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    try {
      final response = await http.post(
        Uri.parse(review),
        headers: {'Accept': 'application/json'},
        body: {
          "recipe_id": recipeId,
          "rating": rating,
          "review": reviewRecipe,
          "user_id": idUser,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add review");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  Future<CheckReview> reviewCheck(String idRecipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();

    final response =
        await http.get(Uri.parse(review + '/' + idRecipe + '/' + idUser));

    if (response.statusCode == 200) {
      return CheckReview.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<String> addReport(String recipeId, String laporan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    try {
      final response = await http.post(
        Uri.parse(report),
        headers: {'Accept': 'application/json'},
        body: {
          "report": laporan,
          "user_id": idUser,
          "recipe_id": recipeId,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add review");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  Future<CheckReport> reviewReport(String idRecipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();

    final response =
        await http.get(Uri.parse(report + '/' + idRecipe + '/' + idUser));

    if (response.statusCode == 200) {
      return CheckReport.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  static Future<String> addIngredient(
      String name, String value, idRecipe) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + 'ingredients'),
        headers: {'Accept': 'application/json'},
        body: {
          "name": name,
          "value": value,
          "recipe_id": idRecipe,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<String> addStep(String step, idRecipe) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + 'step'),
        headers: {'Accept': 'application/json'},
        body: {
          "step": step,
          "recipe_id": idRecipe,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<String> addCategory(String step) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + 'category'),
        headers: {'Accept': 'application/json'},
        body: {
          "category": category,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<String> addCategoryRecipe(recipeId, categoryId) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + 'category-recipe'),
        headers: {'Accept': 'application/json'},
        body: {
          "recipe_id": recipeId,
          "category_id": categoryId,
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed add favorite");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }
}
