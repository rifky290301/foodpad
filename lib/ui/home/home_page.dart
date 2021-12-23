// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/add_recipe/add_recipe_page.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:foodpad/ui/favorite_page.dart';
import 'package:foodpad/ui/home/card_recommended.dart';
import 'package:foodpad/ui/home/home_greeting.dart';
import 'package:foodpad/ui/home/ingredients_list.dart';
import 'package:foodpad/ui/home/card_trending.dart';
import 'package:foodpad/ui/home/trending_list_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:foodpad/ui/settings/settings_page.dart';
import 'package:foodpad/widgets/carousels_slider.dart';
import 'package:provider/provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);
  static const routeName = "/main_home_page";

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded, size: 26),
      title: Text('Beranda', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search, size: 24),
      title: Text('Cari', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_rounded, size: 36),
      title: Text('', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_rounded, size: 24),
      title: Text('Favorit', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings, size: 24),
      title: Text(
        'Pengaturan',
        style: TextStyle(fontFamily: font),
      ),
    ),
  ];

  final List<Widget> _listWidget = const [
    HomePage(),
    SearchPage(),
    AddRecipePage(),
    FavoritePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavIndex,
          type: BottomNavigationBarType.fixed,
          items: _bottomNavBarItems,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (selected) {
            setState(() {
              bottomNavIndex = selected;
            });
          }),
    );
  }
}

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
      body: ChangeNotifierProvider<TrendingProvider>(
        create: (_) => TrendingProvider(apiService: ApiService()),
        child: Consumer<TrendingProvider>(builder: (context, state, _) {
          if (state.state == ResultStates.loading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Center(
                    child: CircularProgressIndicator(color: orange),
                  ),
                ],
              ),
            );
          } else if (state.state == ResultStates.hasData) {
            return RefreshIndicator(
              edgeOffset: 50,
              onRefresh: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (a, b, c) => const MainHomePage(),
                        transitionDuration: const Duration(seconds: 0)));
                return Future.value();
              },
              child: Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Greeting(),
                            const SizedBox(height: 28),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SearchPage.routeName);
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
                                    Text('Lagi Trending Nih',
                                        style: headingTextStyle),
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
          } else if (state.state == ResultStates.error) {
            return const ErrorLoad();
          } else {
            return const ErrorLoad();
          }
        }),
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
          return const ErrorLoad();
        } else {
          return const NoInternet();
        }
      },
    );
  }

  Widget _buildRecommendation(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeProvider(apiService: ApiService()),
      child: Consumer<RecipeProvider>(
        builder: (context, state, _) {
          if (state.state == ResultStates.loading) {
            return const Center(
                child: CircularProgressIndicator(color: orange));
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
      ),
    );
  }
}
