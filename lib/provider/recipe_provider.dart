import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/category_model.dart';
import 'package:foodpad/models/recipe2_model.dart';
import 'package:foodpad/models/recipe_detail_model.dart';

enum ResultStates { loading, noData, hasData, error, noConnection }

class RecipeProvider extends ChangeNotifier {
  final ApiService apiService;

  RecipeProvider({required this.apiService}) {
    _fetchAllRecipe();
  }

  late Recipe2Result _recipeResult;
  late ResultStates _state;
  String _message = '';
  String? _query;

  Recipe2Result get recipeResult => _recipeResult;
  ResultStates get state => _state;
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

  void setSorting(String? query) {
    _query = query;
    _recipeSorting();
    notifyListeners();
  }

  Future<dynamic> _fetchAllRecipe() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final recipe = await apiService.recipeList2(query);
      if (recipe.data == null) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStates.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }

  Future<dynamic> _recipeSorting() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final recipe = await apiService.recipeShorting(query!);
      if (recipe.data == null) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStates.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}

class IngredientRecipeProvider extends ChangeNotifier {
  final ApiService apiService;
  final String category;

  IngredientRecipeProvider({required this.apiService, required this.category}) {
    _fetchIngredientRecipe();
  }

  late Recipe2Result _recipeResult;
  late ResultStates _state;
  String _message = '';
  String? _query;

  Recipe2Result get recipeResult => _recipeResult;
  ResultStates get state => _state;
  String get message => _message;
  String? get query => _query;

  void refresh() {
    _query = query;
    _fetchIngredientRecipe();
    notifyListeners();
  }

  Future<dynamic> _fetchIngredientRecipe() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final recipe = await apiService.ingredientRecipeList(category);
      if (recipe.data.isEmpty) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStates.error;
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

  late RecipeDetail _recipeResult;
  late ResultStates _state;
  String _message = '';
  final String id;

  RecipeDetail get recipeResult => _recipeResult;
  ResultStates get state => _state;
  String get message => _message;

  Future<dynamic> _fetchAllRecipe() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final recipe = await apiService.recipeDetail2(id);
      if (recipe.data.isEmpty) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStates.error;
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
  late ResultStates _state;
  String _message = '';

  Category2 get categoryResult => _categoryResult;
  ResultStates get state => _state;
  String get message => _message;

  void refresh() {
    _fetchAllCategory();
    notifyListeners();
  }

  Future<dynamic> _fetchAllCategory() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final categories = await apiService.categoryList();
      if (categories.data!.isEmpty) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _categoryResult = categories;
      }
    } catch (e) {
      _state = ResultStates.error;
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
  late ResultStates _state;
  String _message = '';

  Recipe2Result get recipeResult => _recipeResult;
  ResultStates get state => _state;
  String get message => _message;

  void refresh() {
    _fetchAllTrending();
    notifyListeners();
  }

  Future<dynamic> _fetchAllTrending() async {
    try {
      _state = ResultStates.loading;
      notifyListeners();

      final recipe = await apiService.trendingList();
      if (recipe.data.isEmpty) {
        _state = ResultStates.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStates.hasData;
        notifyListeners();
        return _recipeResult = recipe;
      }
    } catch (e) {
      _state = ResultStates.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}
