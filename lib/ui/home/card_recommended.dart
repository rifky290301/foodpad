import 'package:flutter/material.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/widgets/recipe_bottom_sheet.dart';

class HomeCardRecommended extends StatelessWidget {
  final Recipe recipe;
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
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  recipe.thumbnail,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  Text(recipe.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: itemTitleTextStyle),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_rounded,
                          size: 16, color: orangeSecondary),
                      Icon(Icons.star_half_rounded,
                          size: 16, color: orangeSecondary),
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
                        children: [
                          const Icon(Icons.av_timer_outlined,
                              size: 18, color: orange),
                          Text('${recipe.duration}mnt'.toString(),
                              style: smallSubtitleTextStyle),
                          const SizedBox(width: 3),
                          const Icon(Icons.insert_chart,
                              size: 18, color: orange),
                          const SizedBox(width: 1),
                          Text(recipe.level, style: smallSubtitleTextStyle),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
