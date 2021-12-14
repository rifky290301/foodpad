import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/recipe2_model.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';

class HomeCardRecommended extends StatelessWidget {
  final Datum recipe;
  const HomeCardRecommended({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigation.intentWithData(DetailPage.routeName, recipe.id.toString());
        },
        child: SizedBox(
          width: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    recipe.thumbnail.toString(),
                    alignment: Alignment.center,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Text(recipe.name.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: itemTitleTextStyle),
                      ],
                    )),
              ]),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RatingBar.builder(
                              initialRating: double.parse(recipe.rating),
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
                            Text('${recipe.rating}/5',
                                style: smallSubtitleTextStyle),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.av_timer_outlined,
                                    size: 18, color: orange),
                                Text('${recipe.duration}mnt'.toString(),
                                    style: smallSubtitleTextStyle),
                                const SizedBox(width: 3),
                                const Icon(Icons.insert_chart,
                                    size: 18, color: orange),
                                const SizedBox(width: 1),
                                Text(recipe.level.toString(),
                                    style: smallSubtitleTextStyle),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => recipeBottomSheet(context),
                                  child: const Icon(Icons.more_horiz,
                                      size: 20, color: grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardRecommended extends StatelessWidget {
  final Datum recipe;
  const CardRecommended({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, DetailPage.routeName),
        child: SizedBox(
          width: 165,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  recipe.thumbnail.toString(),
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(recipe.name.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: itemTitleTextStyle),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.star_rounded,
                              size: 18, color: orangeSecondary),
                          Icon(Icons.star_rounded,
                              size: 18, color: orangeSecondary),
                          Icon(Icons.star_rounded,
                              size: 18, color: orangeSecondary),
                          Icon(Icons.star_rounded,
                              size: 18, color: orangeSecondary),
                          Icon(Icons.star_half_rounded,
                              size: 18, color: orangeSecondary),
                          const SizedBox(width: 4),
                          Text('4.5/5', style: smallSubtitleTextStyle),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.av_timer_outlined,
                                  size: 18, color: orange),
                              SizedBox(width: 2),
                              Text('60 mnt',
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 11,
                                      color: grey)),
                              SizedBox(width: 6),
                              Icon(Icons.insert_chart, size: 18, color: orange),
                              SizedBox(width: 2),
                              Text('Mudah',
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 11,
                                      color: grey)),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () => recipeBottomSheet(context),
                                  child: const Icon(Icons.more_horiz,
                                      size: 20, color: grey))
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
