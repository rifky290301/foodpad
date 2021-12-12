import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/preferences_provider.dart';
import 'package:foodpad/ui/authentication/login_page.dart';
import 'package:foodpad/ui/main_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Consumer<PreferencesProvider>(builder: (context, provider, _) {
            if (provider.isLoggedIn) {
              return const MainPage();
            } else {
              return const LoginPage();
            }
          });
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: orange,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.food_bank_outlined, color: white, size: 80),
                Text(
                  'FoodPad',
                  style: TextStyle(
                    fontFamily: font,
                    fontWeight: FontWeight.w700,
                    color: white,
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        );
      },
    );
  }
}
