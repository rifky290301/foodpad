import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite', style: titleTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Favorite Page', style: subtitleTextStyle),
      ),
    );
  }
}
