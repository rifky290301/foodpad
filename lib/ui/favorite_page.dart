import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/favorite_model.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/add_recipe/add_recipe_page.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/error/no_favorite.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:foodpad/ui/error/not_found.dart';
import 'package:foodpad/ui/home/card_recommended.dart';
import 'package:foodpad/ui/home/home_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:foodpad/ui/settings/settings_page.dart';
import 'package:http/http.dart' as http;
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainFavoritePage extends StatefulWidget {
  const MainFavoritePage({Key? key}) : super(key: key);
  static const routeName = '/main_favorite_page';
  @override
  _MainFavoritePageState createState() => _MainFavoritePageState();
}

class _MainFavoritePageState extends State<MainFavoritePage> {
  int bottomNavIndex = 3;

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
      body: _listWidget[bottomNavIndex],
    );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static const routeName = '/favorite_page';

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Future<FavoriteResult> favoriteList() async {
    String _baseUrl = 'http://api-foodpad.herokuapp.com/api/';
    String favorite2 = _baseUrl + 'favorite2';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idUser = prefs.get('id').toString();
    final response = await http.get(Uri.parse(favorite2 + idUser));

    if (response.statusCode == 200) {
      return FavoriteResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menampilkan favorit');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteProvider>(
      create: (_) => FavoriteProvider(apiService: ApiService()),
      child: Scaffold(
        body: RefreshIndicator(
          edgeOffset: 50,
          onRefresh: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => const MainFavoritePage(),
                    transitionDuration: const Duration(seconds: 0)));
            return Future.value();
          },
          child: ListView(children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<FavoriteProvider>(
                        builder: (context, state, _) {
                          if (state.state == ResultState.loading) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: Stack(
                                alignment: Alignment.center,
                                children: const [
                                  Center(
                                    child: CircularProgressIndicator(
                                        color: orange),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            if (state.state == ResultState.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Favorit',
                                            style: helloTextStyle),
                                        Text(
                                            '${state.recipeResult.data!.length.toString()} Resep kesukaanmu',
                                            style: blackTextStyle),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildFavorite(state),
                                  const SizedBox(height: 16),
                                  const RecommendedList(),
                                ],
                              );
                            } else if (state.state == ResultState.noData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Favorit', style: helloTextStyle),
                                        Text('0 Resep kesukaanmu',
                                            style: blackTextStyle),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const NoFavorite(),
                                  const RecommendedList(),
                                ],
                              );
                            } else if (state.state == ResultState.error) {
                              return const ErrorLoad();
                            } else {
                              return const NoInternet();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildFavorite(FavoriteProvider state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: state.recipeResult.data!.length,
      itemBuilder: (context, index) {
        return CardFavorite(
          recipe: state.recipeResult.data![index],
        );
      },
    );
  }
}

class RecommendedList extends StatelessWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('Rekomendasi Buat Kamu', style: headingTextStyle),
        ),
        const SizedBox(height: 8),
        ChangeNotifierProvider<RecipeProvider>(
          create: (_) => RecipeProvider(apiService: ApiService()),
          child: Consumer<RecipeProvider>(
            builder: (context, state, _) {
              if (state.state == ResultStates.loading) {
                return Column(children: const [
                  SizedBox(height: 16),
                  Center(child: CircularProgressIndicator(color: orange)),
                ]);
              } else {
                if (state.state == ResultStates.hasData) {
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return HomeCardRecommended(
                          recipe: state.recipeResult.data[index],
                        );
                      },
                    ),
                  );
                } else if (state.state == ResultStates.noData) {
                  return const NotFound();
                } else if (state.state == ResultStates.error) {
                  return const ErrorLoad();
                } else {
                  return const NoInternet();
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

class CardFavorite extends StatefulWidget {
  final Datum recipe;
  const CardFavorite({Key? key, required this.recipe}) : super(key: key);

  @override
  State<CardFavorite> createState() => _CardFavoriteState();
}

class _CardFavoriteState extends State<CardFavorite> {
  FavoriteProvider instanceFavorite =
      FavoriteProvider(apiService: ApiService());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.intentWithData(
            DetailPage.routeName, (widget.recipe.recipeId).toString());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  widget.recipe.thumbnail.toString(),
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      widget.recipe.name.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: itemTitleTextStyle,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingBar.builder(
                        initialRating:
                            double.parse(widget.recipe.rating.toString()),
                        allowHalfRating: true,
                        ignoreGestures: true,
                        minRating: 1,
                        maxRating: 5,
                        itemCount: 5,
                        itemSize: 18.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 4),
                      Text('${widget.recipe.rating}/5',
                          style: smallSubtitleTextStyle),
                    ],
                  ),
                  SizedBox(
                    width: 250,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.av_timer_outlined,
                                    size: 18, color: orange),
                                const SizedBox(width: 2),
                                Text(
                                  widget.recipe.duration.toString() + ' menit',
                                  style: const TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: grey,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.insert_chart,
                                    size: 18, color: orange),
                                const SizedBox(width: 2),
                                Text(
                                  widget.recipe.level.toString(),
                                  style: const TextStyle(
                                    fontFamily: font,
                                    fontSize: 12,
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Hapus Resep Favorit',
                                          style: titleTextStyle,
                                        ),
                                        content: const Text(
                                            'Apakah kamu yakin ingin menghapus resep ini dari favorit?',
                                            style: blackTextStyle),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'CANCEL'),
                                            child: const Text('Batal',
                                                style: TextStyle(
                                                    fontFamily: font,
                                                    color: white)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                instanceFavorite.deleteFavorite(
                                                    widget.recipe.id
                                                        .toString());
                                                Navigator.pushReplacement(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (a, b, c) =>
                                                        const MainFavoritePage(),
                                                    transitionDuration:
                                                        const Duration(
                                                            seconds: 0),
                                                  ),
                                                );
                                              });
                                              Future.value();
                                            },
                                            child: const Text(
                                              'Ya, Hapus',
                                              style: TextStyle(
                                                fontFamily: font,
                                                color: orange,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.delete_forever,
                                      color: orange, size: 26),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
