import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/favorite_model.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:foodpad/ui/home/card_trending.dart';
import 'package:foodpad/ui/home/recommended_list.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Favorit', style: helloTextStyle),
                      Text('10 Resep kesukaanmu', style: blackTextStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<FavoriteProvider>(
                  builder: (context, state, _) {
                    if (state.state == ResultState.loading) {
                      return const Center(
                          child: CircularProgressIndicator(color: orange));
                    } else {
                      if (state.state == ResultState.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.recipeResult.favorite.length,
                          itemBuilder: (context, index) {
                            return CardFavorite(
                              recipe: state.recipeResult.favorite[index].recipe,
                            );
                          },
                        );
                      } else if (state.state == ResultState.noData) {
                        return Center(child: Text(state.message));
                      } else if (state.state == ResultState.error) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Text('');
                      }
                    }
                  },
                ),
                const Divider(
                  color: grey,
                ),
                const SizedBox(height: 8),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8),
                //   child: Text('Rekomendasi Buat Kamu', style: headingTextStyle),
                // ),
                // const SizedBox(height: 8),
                // SizedBox(
                //   height: 278,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       physics: const ClampingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 10,
                //       itemBuilder: (context, index) {
                //         return const CardRecommended();
                //       }),
                // ),
                const RecommendedList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardFavorite extends StatelessWidget {
  final Recipe recipe;
  const CardFavorite({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.intentWithData(DetailPage.routeName, recipe.id);
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
                  recipe.thumbnail,
                  width: 85,
                  height: 85,
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
                    child: Text(recipe.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: itemTitleTextStyle),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star_rounded,
                          size: 20, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 20, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 20, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 20, color: orangeSecondary),
                      Icon(Icons.star_half_rounded,
                          size: 20, color: orangeSecondary),
                      const SizedBox(width: 4),
                      const Text(
                        '4.5/5',
                        style: TextStyle(
                            fontFamily: font, fontSize: 12, color: grey),
                      ),
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
                                SizedBox(width: 2),
                                Text(recipe.duration.toString() + ' menit',
                                    style: const TextStyle(
                                        fontFamily: font,
                                        fontSize: 12,
                                        color: grey)),
                                const SizedBox(width: 6),
                                const Icon(Icons.insert_chart,
                                    size: 18, color: orange),
                                SizedBox(width: 2),
                                Text(recipe.level,
                                    style: const TextStyle(
                                        fontFamily: font,
                                        fontSize: 12,
                                        color: grey)),
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
                                            onPressed: () => Navigator.pop(
                                                context, 'DELETE'),
                                            child: const Text('Ya, Hapus',
                                                style: TextStyle(
                                                    fontFamily: font,
                                                    color: orange)),
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
