import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';

class HomeCardTrending extends StatelessWidget {
  final Datum recipe;
  const HomeCardTrending({Key? key, required this.recipe}) : super(key: key);

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
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
                recipeId: recipe.id.toString(), name: recipe.name);
          }));
        },
        child: SizedBox(
          width: 160,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  recipe.thumbnail.toString(),
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  Text(recipe.name.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: itemTitleTextStyle),
                  const SizedBox(height: 12),
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
                      Text('${recipe.rating}/5', style: smallSubtitleTextStyle),
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
                            onTap: () => recipeBottomSheet(
                                context, recipe.id, recipe.name),
                            child: const Icon(Icons.more_horiz,
                                size: 20, color: grey),
                          )
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
