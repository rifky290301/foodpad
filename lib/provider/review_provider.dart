import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/recipe_detail_model.dart';

enum ResultState { loading, noData, hasData, error, noConnection }

class ReviewProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idRecipe;

  ReviewProvider({required this.apiService, required this.idRecipe}) {
    _reviewCheck(idRecipe);
  }

  late Rating _reviewResult;
  late ResultState _state;
  String _message = '';

  Rating get reviewResult => _reviewResult;
  ResultState get state => _state;
  String get message => _message;

  void addReview(idRecipe, rating, review) {
    apiService.addReview(idRecipe, rating, review);
    _reviewCheck(idRecipe);
    notifyListeners();
  }

  Future<dynamic> _reviewCheck(idRecipe) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final recipe = await apiService.reviewCheck(idRecipe);
      if (recipe.review.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _reviewResult = recipe;
      }
    } catch (e) {
      _state = ResultState.error;
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}
