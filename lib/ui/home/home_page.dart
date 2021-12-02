import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/home/home_greeting.dart';
import 'package:foodpad/ui/home/recommended_list.dart';
import 'package:foodpad/ui/home/ingredients_list.dart';
import 'package:foodpad/ui/home/card_trending.dart';
import 'package:foodpad/ui/home/trending_list_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:foodpad/widgets/carousels_slider.dart';
import 'package:provider/provider.dart';

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
              child: Consumer<RecipeProvider>(builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return Center(
                    child: CircularProgressIndicator(color: orange),
                  );
                } else if (state.state == ResultState.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Greeting(),
                      const SizedBox(height: 28),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SearchPage.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 48,
                          child: Row(
                            children: const [
                              SizedBox(width: 16),
                              Icon(Icons.search, color: grey),
                              SizedBox(width: 8),
                              Text('Cari resep makanan...',
                                  style: subtitleTextStyle),
                            ],
                          ),
                        ),
                      ),
                      CarouselsSlider(),
                      HomeIngredientsList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Text('Lagi Trending Nih',
                                  style: headingTextStyle),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, TrendingListPage.routeName),
                                child: Text('Lihat Semua',
                                    style: orangeSmallTextStyle),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 278,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.recipeResult.recipes.length,
                            itemBuilder: (context, index) {
                              return HomeCardTrending(
                                recipe: state.recipeResult.recipes[index],
                              );
                            }),
                      ),
                      const SizedBox(height: 28),
                      RecommendedList(),
                    ],
                  );
                } else if (state.state == ResultState.error) {
                  return Center(child: Text('Error'));
                } else {
                  return Text('');
                }
              })),
        ),
      ),
    );
  }
}
