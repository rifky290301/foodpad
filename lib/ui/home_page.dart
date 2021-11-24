import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: titleTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Home Page', style: subtitleTextStyle),
      ),
    );
  }
}
