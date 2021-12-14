import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/favorite_model.dart';

enum ResultState { loading, noData, hasData, error, noConnection }

class FavoriteProvider extends ChangeNotifier {
  final ApiService apiService;

  FavoriteProvider({required this.apiService}) {
    _fetchAllFavorite();
  }

  late FavoriteResult _recipeResult;
  late ResultState _state;
  String _message = '';

  FavoriteResult get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;

  void deleteFavorite(idFavorite) {
    apiService.deleteFovorite(idFavorite);
    _fetchAllFavorite();
    notifyListeners();
  }

  void addFavorite(idRecipe) {
    apiService.addFavorite(idRecipe);
    FavoriteCheckProvider(apiService: apiService, idRecipe: idRecipe);
    _fetchAllFavorite();
    notifyListeners();
  }

  Future<dynamic> _fetchAllFavorite() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.favoriteList();
      if (recipe.data!.isEmpty) {
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

class FavoriteCheckProvider extends ChangeNotifier {
  final ApiService apiService;

  FavoriteCheckProvider({required this.apiService, required this.idRecipe}) {
    _checkFavorite();
  }

  late FavoriteResult _favoriteResult;
  late ResultState _state;
  String _message = '';
  final String idRecipe;

  FavoriteResult get favoriteResult => _favoriteResult;
  ResultState get state => _state;
  String get message => _message;
  String get ids => idRecipe;

  void addFavorite(idRecipe) {
    apiService.addFavorite(idRecipe);
    FavoriteProvider(apiService: apiService);
    _checkFavorite();
    notifyListeners();
  }

  void deleteFavorite(idRecipe) {
    apiService.deleteFovorite(idRecipe);
    FavoriteProvider(apiService: apiService);
    _checkFavorite();
    notifyListeners();
  }

  Future<dynamic> _checkFavorite() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.favoriteCheck(idRecipe);
      if (recipe.data!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _favoriteResult = recipe;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}
