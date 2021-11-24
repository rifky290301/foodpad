import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = '/home_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search', style: titleTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Search Page', style: subtitleTextStyle),
      ),
    );
  }
}
