import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/category_model.dart';
import 'package:foodpad/models/recipe2_model.dart';
import 'package:foodpad/models/recipe_model.dart';

enum ResultState { loading, noData, hasData, error, noConnection }

class RecipeProvider extends ChangeNotifier {
  final ApiService apiService;

  RecipeProvider({required this.apiService}) {
    _fetchAllRecipe();
  }

  late Recipe2Result _recipeResult;
  late ResultState _state;
  String _message = '';
  String? _query;

  Recipe2Result get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;
  String? get query => _query;

  void refresh() {
    _query = query;
    _fetchAllRecipe();
    notifyListeners();
  }

  void setQuery(String? query) {
    _query = query;
    _fetchAllRecipe();
    notifyListeners();
  }

  setShorting(String? query) {
    _query = query;
    print(_query);
    _recipeShoriting();
    notifyListeners();
  }

  Future<dynamic> _fetchAllRecipe() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.recipeList2(query);
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

  Future<dynamic> _recipeShoriting() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.recipeShoriting(query!);
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

  late Category2 _categoryResult;
  late ResultState _state;
  String _message = '';

  Category2 get categoryResult => _categoryResult;
  ResultState get state => _state;
  String get message => _message;

  void refresh() {
    _fetchAllCategory();
    notifyListeners();
  }

  Future<dynamic> _fetchAllCategory() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final categories = await apiService.categoryList();
      if (categories.data!.isEmpty) {
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

class TrendingProvider extends ChangeNotifier {
  final ApiService apiService;

  TrendingProvider({required this.apiService}) {
    _fetchAllTrending();
  }

  late Recipe2Result _recipeResult;
  late ResultState _state;
  String _message = '';

  Recipe2Result get recipeResult => _recipeResult;
  ResultState get state => _state;
  String get message => _message;

  void refresh() {
    _fetchAllTrending();
    notifyListeners();
  }

  Future<dynamic> _fetchAllTrending() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.trendingList();
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
