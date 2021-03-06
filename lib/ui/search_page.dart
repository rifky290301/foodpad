import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:foodpad/ui/error/not_found.dart';
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
  RecipeProvider instanceRecipe = RecipeProvider(apiService: ApiService());

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
                ChangeNotifierProvider<RecipeProvider>(
                  create: (_) => RecipeProvider(apiService: ApiService()),
                  child: Consumer<RecipeProvider>(
                    builder: (context, state, _) {
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Pencarian',
                                            style: helloTextStyle),
                                        Text('Mau cari resep apa?',
                                            style: blackTextStyle),
                                      ],
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 28),
                            _formSearch(context, state),
                            const SizedBox(height: 16),
                            ListView.builder(
                              itemCount: state.recipeResult.data.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var recipe = state.recipeResult.data[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailPage(
                                          recipeId: recipe.id.toString(),
                                          name: recipe.name);
                                    }));
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
                                              recipe.thumbnail.toString(),
                                              width: 85,
                                              height: 85,
                                              fit: BoxFit.cover,
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
                                                    recipe.name.toString(),
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
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        recipe.rating),
                                                    allowHalfRating: true,
                                                    ignoreGestures: true,
                                                    minRating: 1,
                                                    maxRating: 5,
                                                    itemCount: 5,
                                                    itemSize: 18.0,
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star_rounded,
                                                      color: Colors.orange,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text('${recipe.rating}/5',
                                                      style:
                                                          smallSubtitleTextStyle),
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
                                                            const SizedBox(
                                                                width: 2),
                                                            Text(
                                                                recipe.duration
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
                                                            const SizedBox(
                                                                width: 2),
                                                            Text(
                                                                recipe.level
                                                                    .toString(),
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
                      } else if (state.state == ResultStates.error) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Pencarian',
                                            style: helloTextStyle),
                                        Text('Mau cari resep apa?',
                                            style: blackTextStyle),
                                      ],
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 28),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('Kategori',
                                  style: itemTitleTextStyle,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(height: 8),
                            _formSearch(context, state),
                            const SizedBox(height: 16),
                            const NotFound(),
                          ],
                        );
                      } else if (state.state == ResultStates.noData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Pencarian',
                                            style: helloTextStyle),
                                        Text('Mau cari resep apa?',
                                            style: blackTextStyle),
                                      ],
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 28),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('Kategori',
                                  style: itemTitleTextStyle,
                                  textAlign: TextAlign.left),
                            ),
                            const SizedBox(height: 8),
                            _formSearch(context, state),
                            const SizedBox(height: 16),
                            const NotFound(),
                          ],
                        );
                      } else {
                        return const NoInternet();
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

  Widget _formSearch(BuildContext context, RecipeProvider state) {
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
                  textInputAction: TextInputAction.search,
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
                        state.setQuery(_search.text);
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
}
