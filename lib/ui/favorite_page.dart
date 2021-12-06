import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/home/card_recommended.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
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
                          itemCount: state.recipeResult.recipes.length,
                          itemBuilder: (context, index) {
                            return Text("data");
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Rekomendasi Buat Kamu', style: headingTextStyle),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const HomeCardRecommended();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
