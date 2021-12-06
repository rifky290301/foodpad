import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  static storeUser(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('id', data.user.id);
    await prefs.setString('firstName', data.user.firstName ?? 'defalut name');
    await prefs.setString('lastName', data.user.lastName);
    await prefs.setString('email', data.user.email);
    await prefs.setString(
        'profilePicture', data.user.profilePicture ?? 'images/logo.png');
    await prefs.setString('tokens', data.token.plainTextToken);
  }

  static logoutProcess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static getUserIdPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');
    return userId.toString();
  }

  // static Future<String> getPrefs(key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key) ?? '';
  // }
}
