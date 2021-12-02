import 'dart:convert';
import 'package:foodpad/models/rating_model.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://api-foodpad.herokuapp.com/api/';
  static const String recipe = _baseUrl + 'recipe';
  static const String login = _baseUrl + 'login';
  static const String register = _baseUrl + 'register';
  static const String logout = _baseUrl + 'logout';
  static const String detail = _baseUrl + 'recipe/';
  static const String rating = _baseUrl + 'rating';
  static const String profilePic = _baseUrl + 'user/photo-profile/';
  static const String category = _baseUrl + 'category';

  Future<RecipeResult> recipeList(http.Client client) async {
    final response = await client.get(Uri.parse(recipe));

    if (response.statusCode == 200) {
      return RecipeResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan resep');
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

  Future<RatingResult> ratingList() async {
    final response = await http.get(Uri.parse(recipe));

    if (response.statusCode == 200) {
      return RatingResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan rating');
    }
  }

  Future<CategoryResult> categoryList() async {
    final response = await http.get(Uri.parse(category));

    if (response.statusCode == 200) {
      return CategoryResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan kategori');
    }
  }
}
