import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/widgets/action_bar.dart';
import 'package:provider/provider.dart';

class TrendingListPage extends StatefulWidget {
  const TrendingListPage({Key? key}) : super(key: key);

  static const routeName = '/trending_list_page';
  @override
  TrendingListPageState createState() => TrendingListPageState();
}

class TrendingListPageState extends State<TrendingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: black,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const ActionBarNoMenu("Trending"),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ChangeNotifierProvider<TrendingProvider>(
                    create: (_) => TrendingProvider(apiService: ApiService()),
                    child: Consumer<TrendingProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultStates.loading) {
                          return const Center(
                            child: CircularProgressIndicator(color: orange),
                          );
                        } else if (state.state == ResultStates.hasData) {
                          return Column(
                            children: [
                              // _buildCategory(context, state),
                              ListView.builder(
                                itemCount: state.recipeResult.data.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigation.intentWithData(
                                          DetailPage.routeName,
                                          state.recipeResult.data[index].id
                                              .toString());
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6),
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
                                                state.recipeResult.data[index]
                                                    .thumbnail
                                                    .toString(),
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
                                                      state.recipeResult
                                                          .data[index].name
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          itemTitleTextStyle),
                                                ),
                                                const SizedBox(height: 18),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    RatingBar.builder(
                                                      initialRating:
                                                          double.parse(state
                                                              .recipeResult
                                                              .data[index]
                                                              .rating),
                                                      allowHalfRating: true,
                                                      ignoreGestures: true,
                                                      minRating: 1,
                                                      maxRating: 5,
                                                      itemCount: 5,
                                                      itemSize: 20.0,
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
                                                        Icons.star_rounded,
                                                        color: Colors.orange,
                                                      ),
                                                      onRatingUpdate:
                                                          (rating) {},
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      '${state.recipeResult.data[index].rating}/5',
                                                      style: const TextStyle(
                                                          fontFamily: font,
                                                          fontSize: 12,
                                                          color: grey),
                                                    ),
                                                    const SizedBox(width: 8),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
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
                                                                  color:
                                                                      orange),
                                                              const SizedBox(
                                                                  width: 2),
                                                              Text(
                                                                  state
                                                                          .recipeResult
                                                                          .data[
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
                                                                  color:
                                                                      orange),
                                                              const SizedBox(
                                                                  width: 2),
                                                              Text(
                                                                  state
                                                                      .recipeResult
                                                                      .data[
                                                                          index]
                                                                      .level
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
      ),
    );
  }
}
