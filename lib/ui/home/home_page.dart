import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/home/card_recommended.dart';
import 'package:foodpad/ui/home/home_greeting.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
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
                    const CarouselsSlider(),
                    const HomeIngredientsList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text('Lagi Trending Nih', style: headingTextStyle),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, TrendingListPage.routeName),
                              child: const Text('Lihat Semua',
                                  style: orangeSmallTextStyle),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildTrending(context),
                    const SizedBox(height: 28),
                    _buildRecommendation(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrending(BuildContext context) {
    return Consumer<TrendingProvider>(
      builder: (context, state, _) {
        if (state.state == ResultStates.loading) {
          return const Center(child: CircularProgressIndicator(color: orange));
        } else if (state.state == ResultStates.hasData) {
          return SizedBox(
            height: 278,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.recipeResult.data.length,
              itemBuilder: (context, index) {
                return HomeCardTrending(
                  recipe: state.recipeResult.data[index],
                );
              },
            ),
          );
        } else if (state.state == ResultStates.error) {
          return Column(
            children: [
              const Center(child: Text('Error', style: subtitleTextStyle)),
              ElevatedButton(
                child: const Text('Refresh'),
                onPressed: () => state.refresh(),
                style: ElevatedButton.styleFrom(
                  primary: orange,
                ),
              ),
            ],
          );
        } else {
          return const Text('');
        }
      },
    );
  }

  Widget _buildRecommendation(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, state, _) {
        if (state.state == ResultStates.loading) {
          return const Center(child: CircularProgressIndicator(color: orange));
        } else if (state.state == ResultStates.hasData) {
          return Column(
            children: [
              Row(
                children: const [
                  Text('Rekomendasi Buat Kamu', style: headingTextStyle),
                ],
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: (16 / 26.4),
                mainAxisSpacing: 5,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children:
                    List.generate(state.recipeResult.data.length, (index) {
                  return HomeCardRecommended(
                      recipe: state.recipeResult.data[index]);
                }),
              ),
            ],
          );
        } else if (state.state == ResultStates.error) {
          return const Center(child: Text('Error', style: subtitleTextStyle));
        } else {
          return const Text('sekedar cek');
        }
      },
    );
  }
}
