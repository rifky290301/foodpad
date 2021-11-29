import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Settings Page', style: subtitleTextStyle),
      ),
    );
  }
}
