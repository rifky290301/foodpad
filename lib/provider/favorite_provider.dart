import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ResultState { loading, noData, hasData, error, noConnection }

class FavoriteProvider extends ChangeNotifier {
  final ApiService apiService;

  FavoriteProvider({required this.apiService}) {
    _fetchAllFavorite(1);
  }

  late RecipeResult _recipeResult;
  late ResultState _state;
  String _message = '';

  RecipeResult get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllFavorite(idUser) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.favoriteList(idUser);
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

  getValuePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringId = prefs.getString('id');
    return stringId!;
  }
}

class FavoriteCheckProvider extends ChangeNotifier {
  final ApiService apiService;

  FavoriteCheckProvider({required this.apiService, required this.idRecipe}) {
    _checkFavorite(1);
  }

  late RecipeResult _recipeResult;
  late ResultState _state;
  String _message = '';
  final String idRecipe;

  RecipeResult get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;
  String get ids => idRecipe;

  getValuePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringId = prefs.getString('id');
    return stringId!;
  }

  Future<dynamic> _checkFavorite(idUser) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.favoriteCheck(idRecipe, idUser);
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

  addFavorite(idUser, idRecipe) async {}

  deleteFavorite() async {}
}
