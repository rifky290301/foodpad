import 'package:flutter/material.dart';
import 'package:foodpad/utils/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  bool _isRecipeNotificationActive = false;
  bool _isLoggedIn = false;
  bool get isRecipeNotificationActive => _isRecipeNotificationActive;
  bool get isLoggedIn => _isLoggedIn;

  PreferencesProvider({required this.preferencesHelper}) {
    _getRecipeNotificationPreferences();
    _getLoggedInPreferences();
  }

  void _getRecipeNotificationPreferences() async {
    _isRecipeNotificationActive = await preferencesHelper.isNotificationActive;
    notifyListeners();
  }

  void enableRecipeNotification(bool value) {
    preferencesHelper.setRecipeNotification(value);
    _getRecipeNotificationPreferences();
  }

  void _getLoggedInPreferences() async {
    _isLoggedIn = await preferencesHelper.isLoggedIn;
  }

  void allowLogin(bool value) {
    preferencesHelper.setLogin(value);
    _getLoggedInPreferences();
  }
}
