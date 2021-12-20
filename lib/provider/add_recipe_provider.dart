import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/recipe_detail_model.dart';

enum ResultStateReview { loading, noData, hasData, error }

class AddRecipeProvider extends ChangeNotifier {
  final ApiService apiService;

  AddRecipeProvider({required this.apiService}) {
    // _recipeCheck();
  }

  late CheckReview _reviewResult;
  late ResultStateReview _state;
  String _message = '';

  CheckReview get reviewResult => _reviewResult;
  ResultStateReview get state => _state;
  String get message => _message;

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  // void addRecipe(name, thumbnail, description, prepare, duration, level) {
  //   apiService.addRecipe(
  //       name, thumbnail, description, prepare, duration, level);
  //   notifyListeners();
  // }

  // Future<dynamic> _recipeCheck() async {
  //   try {
  //     _state = ResultStateReview.loading;
  //     notifyListeners();

  //     final recipe = await apiService.reviewCheck(idRecipe);
  //     if (recipe.data.isEmpty) {
  //       _state = ResultStateReview.noData;
  //       notifyListeners();
  //       return _message = 'No Data';
  //     } else {
  //       _state = ResultStateReview.hasData;
  //       notifyListeners();
  //       return _reviewResult = recipe;
  //     }
  //   } catch (e) {
  //     _state = ResultStateReview.error;
  //     notifyListeners();
  //     return _message = 'Periksa koneksi internetmu.';
  //   }
  // }
}
