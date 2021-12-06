import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const recipeNotification = 'RECIPE_NOTIFICATION';
  static const loggedIn = 'LOGGED_IN';

  Future<bool> get isNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(recipeNotification) ?? false;
  }

  void setRecipeNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(recipeNotification, value);
  }

  Future<bool> get isLoggedIn async {
    final prefs = await sharedPreferences;
    return prefs.getBool(loggedIn) ?? false;
  }

  void setLogin(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(loggedIn, value);
  }
}
