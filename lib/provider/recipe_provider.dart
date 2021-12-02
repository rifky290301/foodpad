import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum ResultState { loading, noData, hasData, error, noConnection }

class RecipeProvider extends ChangeNotifier {
  final ApiService apiService;

  RecipeProvider({required this.apiService}) {
    _fetchAllRecipe();
  }

  late RecipeResult _recipeResult;
  late ResultState _state;
  String _message = '';

  RecipeResult get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllRecipe() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      http.Client client = http.Client();

      final recipe = await apiService.recipeList(client);
      if (recipe.recipes.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}

class RecipeDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  RecipeDetailProvider({required this.apiService, required this.id}) {
    _fetchAllRecipe();
  }

  late RecipeResult _recipeResult;
  late ResultState _state;
  String _message = '';
  final String id;

  RecipeResult get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;
  String get ids => id;

  Future<dynamic> _fetchAllRecipe() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.recipeDetail(id);
      if (recipe.recipes.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}

class CategoryProvider extends ChangeNotifier {
  final ApiService apiService;

  CategoryProvider({required this.apiService}) {
    _fetchAllCategory();
  }

  late CategoryResult _categoryResult;
  late ResultState _state;
  String _message = '';

  CategoryResult get categoryResult => _categoryResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllCategory() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final categories = await apiService.categoryList();
      if (categories.category.category.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _categoryResult = categories;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}
