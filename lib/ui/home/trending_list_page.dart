import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/widgets/action_bar.dart';

class TrendingListPage extends StatefulWidget {
  const TrendingListPage({Key? key}) : super(key: key);

  static const routeName = '/trending_list_page';
  @override
  TrendingListPageState createState() => TrendingListPageState();
}

class TrendingListPageState extends State<TrendingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: black,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: ActionBar("Trending"),
      ),
      body: Center(
        child: Text('Trending Page'),
      ),
    );
  }
}
