import 'package:flutter/material.dart';
import 'package:foodpad/ui/settings/about_us.dart';
import 'package:foodpad/ui/home/ingredients_list_page.dart';
import 'package:foodpad/ui/home/trending_list_page.dart';
import 'package:foodpad/ui/receipt_detail/detail_page.dart';
import 'package:foodpad/ui/home/home_page.dart';
import 'package:foodpad/ui/main_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        title: 'FoodPad',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const MainPage(),
        routes: {
          MainPage.routeName: (context) => const MainPage(),
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => const DetailPage(),
          SearchPage.routeName: (context) => const SearchPage(),
          IngredientsListPage.routeName: (context) =>
              const IngredientsListPage(),
          TrendingListPage.routeName: (context) => const TrendingListPage(),
        });
  }
}
