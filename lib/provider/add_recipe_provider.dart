import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/recipe_detail_model.dart';

enum ResultStateReview { loading, noData, hasData, error }

class AddRecipeProvider extends ChangeNotifier {
  final ApiService apiService;
  AddRecipeProvider({required this.apiService});

  late CheckReview _reviewResult;
  late ResultStateReview _state;
  final String _message = '';

  CheckReview get reviewResult => _reviewResult;
  ResultStateReview get state => _state;
  String get message => _message;

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
