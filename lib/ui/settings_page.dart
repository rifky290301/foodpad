import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: titleTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings Page', style: subtitleTextStyle),
      ),
    );
  }
}
