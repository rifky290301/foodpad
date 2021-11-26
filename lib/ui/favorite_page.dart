import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/error/no_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite', style: titleTextStyle),
        centerTitle: true,
      ),
      body: NoFavorite(),
    );
  }
}
