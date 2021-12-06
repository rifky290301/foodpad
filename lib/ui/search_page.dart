import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = '/search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Pencarian', style: helloTextStyle),
                            Text('Mau cari resep apa?', style: blackTextStyle),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(height: 28),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Kategori', style: itemTitleTextStyle),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: _buildCategory(context),
                ),
                ChangeNotifierProvider<RecipeProvider>(
                  create: (_) => RecipeProvider(apiService: ApiService()),
                  child: Consumer<RecipeProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(color: orange),
                        );
                      } else if (state.state == ResultState.hasData) {
                        return Column(
                          children: [
                            _formSearch(context, state),
                            ListView.builder(
                              itemCount: state.recipeResult.recipes.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigation.intentWithData(
                                        DetailPage.routeName,
                                        state.recipeResult.recipes[index].id
                                            .toString());
                                  },
                                  child: Card(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                              state.recipeResult.recipes[index]
                                                  .thumbnail,
                                              width: 85,
                                              height: 85,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8, right: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 250,
                                                child: Text(
                                                    state.recipeResult
                                                        .recipes[index].name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: itemTitleTextStyle),
                                              ),
                                              const SizedBox(height: 18),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.star_rounded,
                                                      size: 20,
                                                      color: orangeSecondary),
                                                  Icon(Icons.star_rounded,
                                                      size: 20,
                                                      color: orangeSecondary),
                                                  Icon(Icons.star_rounded,
                                                      size: 20,
                                                      color: orangeSecondary),
                                                  Icon(Icons.star_rounded,
                                                      size: 20,
                                                      color: orangeSecondary),
                                                  Icon(Icons.star_half_rounded,
                                                      size: 20,
                                                      color: orangeSecondary),
                                                  const SizedBox(width: 4),
                                                  const Text(
                                                    '4.5/5',
                                                    style: TextStyle(
                                                        fontFamily: font,
                                                        fontSize: 12,
                                                        color: grey),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 250,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .av_timer_outlined,
                                                                size: 18,
                                                                color: orange),
                                                            SizedBox(width: 2),
                                                            Text(
                                                                state
                                                                        .recipeResult
                                                                        .recipes[
                                                                            index]
                                                                        .duration
                                                                        .toString() +
                                                                    ' menit',
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        font,
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        grey)),
                                                            const SizedBox(
                                                                width: 6),
                                                            const Icon(
                                                                Icons
                                                                    .insert_chart,
                                                                size: 18,
                                                                color: orange),
                                                            SizedBox(width: 2),
                                                            Text(
                                                                state
                                                                    .recipeResult
                                                                    .recipes[
                                                                        index]
                                                                    .level,
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        font,
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        grey)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                showDialog<
                                                                    String>(
                                                                  context:
                                                                      context,
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      AlertDialog(
                                                                    title:
                                                                        const Text(
                                                                      'Hapus Resep Favorit',
                                                                      style:
                                                                          titleTextStyle,
                                                                    ),
                                                                    content: const Text(
                                                                        'Apakah kamu yakin ingin menghapus resep ini dari favorit?',
                                                                        style:
                                                                            blackTextStyle),
                                                                    actions: <
                                                                        Widget>[
                                                                      ElevatedButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            context,
                                                                            'CANCEL'),
                                                                        child: const Text(
                                                                            'Batal',
                                                                            style:
                                                                                TextStyle(fontFamily: font, color: white)),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            context,
                                                                            'DELETE'),
                                                                        child: const Text(
                                                                            'Ya, Hapus',
                                                                            style:
                                                                                TextStyle(fontFamily: font, color: orange)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              child: const Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: orange,
                                                                  size: 26),
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
                              },
                            ),
                          ],
                        );
                      } else if (state.state == ResultState.error) {
                        return const ErrorLoad();
                      } else {
                        return const ErrorLoad();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _formSearch(BuildContext context, RecipeProvider state) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE6E6E6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: TextFormField(
                  controller: _search,
                  cursorColor: orange,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) => state.setQuery(value),
                  style: blackTextStyle,
                  decoration: InputDecoration(
                    labelStyle: subtitleTextStyle,
                    labelText: "Cari resep",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: orange,
                      ),
                      onPressed: () {
                        // controller.searchRestaurant();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator(color: orange));
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: state.categoryResult.category.category.length,
            itemBuilder: (context, index) {
              var categories = state.categoryResult.category.category[index];
              return Card(
                color: orange,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    categories,
                    style: const TextStyle(fontFamily: font, color: white),
                  ),
                ),
              );
            },
          );
        } else if (state.state == ResultState.error) {
          return const Center(child: Text('Error', style: subtitleTextStyle));
        } else {
          return const Text('');
        }
      },
    );
  }
}
