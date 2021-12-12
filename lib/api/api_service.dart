import 'dart:convert';
import 'package:foodpad/models/category_model.dart';
import 'package:foodpad/models/favorite_model.dart';
import 'package:foodpad/models/login_model.dart';
import 'package:foodpad/models/rating_model.dart';
import 'package:foodpad/models/recipe2_model.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:foodpad/provider/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;

class ApiService {
  static const String _baseUrl = 'http://api-foodpad.herokuapp.com/api/';
  static const String recipe = _baseUrl + 'recipe';
  static const String recipe2 = _baseUrl + 'recipe2';
  static const String login = _baseUrl + 'login';
  static const String register = _baseUrl + 'register';
  static const String logout = _baseUrl + 'logout';
  static const String detail = _baseUrl + 'recipe/';
  static const String rating = _baseUrl + 'rating';
  static const String profilePic = _baseUrl + 'user/photo-profile/';
  static const String category = _baseUrl + 'category2';
  static const String favorite = _baseUrl + 'favorite2/';
  static const String search = _baseUrl + 'search/';
  static const String trending = _baseUrl + 'trending2';
  static const String sementara = _baseUrl + 'sementara';
  static const String recipeCategory = _baseUrl + 'recipe-category/';

  Future<RecipeResult> recipeList(query) async {
    String? request;
    if (query == null || query == '') {
      request = sementara;
    } else {
      request = search + query!;
    }
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      return RecipeResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Recipe2Result> recipeList2(query) async {
    String? request;
    if (query == null || query == '') {
      request = recipe2;
    } else {
      request = search + query!;
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

  Future<RecipeResult> recipeDetail(String id) async {
    final response = await http.get(Uri.parse(detail + id));

    if (response.statusCode == 200) {
      return RecipeResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<Recipe2Result> recipeShoriting(String shorting) async {
    final response = await http.get(Uri.parse(recipeCategory + shorting));

    if (response.statusCode == 200) {
      return Recipe2Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
    }
  }

  Future<RatingResult> ratingList() async {
    final response = await http.get(Uri.parse(recipe));

    if (response.statusCode == 200) {
      return RatingResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan rating');
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

  Future<FavoriteResult> favoriteList(idUser) async {
    final response = await http.get(Uri.parse(favorite + idUser));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<FavoriteResult> favoriteCoba(idUser) async {
    final response = await http
        .get(Uri.parse('favorite-http://api-foodpad.herokuapp.com/api/user'));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }

  Future<FavoriteResult> favoriteCheck(String idRecipe, String idUser) async {
    final response =
        await http.get(Uri.parse(favorite + idRecipe + '/' + idUser));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
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
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
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
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw new Exception("Failed regsiter user");
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }
}
