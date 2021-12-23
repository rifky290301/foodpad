import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  static storeUser(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('id', data.user.id);
    await prefs.setString('firstName', data.user.firstName);
    await prefs.setString('lastName', data.user.lastName);
    await prefs.setString('email', data.user.email);
  }

  static logoutProcess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
