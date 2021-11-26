import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/home/home_greeting.dart';
import 'package:foodpad/ui/home/recommended_list.dart';
import 'package:foodpad/ui/home/ingredients_list.dart';
import 'package:foodpad/ui/home/card_trending.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:foodpad/widgets/carousels_slider.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Greeting(),
                const SizedBox(height: 28),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SearchPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 48,
                    child: Row(
                      children: const [
                        SizedBox(width: 16),
                        Icon(Icons.search, color: gray),
                        SizedBox(width: 8),
                        Text('Cari resep makanan...', style: subtitleTextStyle),
                      ],
                    ),
                  ),
                ),
                CarouselsSlider(),
                HomeIngredientsList(),
                HomeCardTrending(),
                RecommendedList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
