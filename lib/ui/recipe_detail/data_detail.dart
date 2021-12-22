import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/recipe_detail_model.dart';
import 'package:foodpad/ui/error/no_review.dart';

class DataDetail extends StatelessWidget {
  final Detail recipeDetail;
  final String recipeId;
  const DataDetail(
      {Key? key, required this.recipeDetail, required this.recipeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(recipeDetail.thumbnail),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recipeDetail.name, style: titleTextStyle),
              const SizedBox(height: 8),
              SizedBox(
                  height: 36,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recipeDetail.categories.length,
                      itemBuilder: (context, index) {
                        return ChipCategories(
                            category: recipeDetail.categories[index]);
                      })),
              const SizedBox(height: 16),
              Text(recipeDetail.description, style: subtitleTextStyle),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.microwave_rounded,
                            size: 36, color: Colors.black45),
                        Text(
                          recipeDetail.prepare.toString() + ' menit',
                          style: orangeTextStyle,
                        ),
                        const Text('Persiapan', style: textStyle),
                      ],
                    )
                  ]),
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time_rounded,
                            size: 32, color: Colors.black45),
                        Text(recipeDetail.duration.toString() + ' menit',
                            style: orangeTextStyle),
                        const Text('Memasak', style: textStyle),
                      ],
                    )
                  ]),
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.description_rounded,
                            size: 34, color: Colors.black45),
                        Text(recipeDetail.level, style: orangeTextStyle),
                        const Text('Kesulitan', style: textStyle),
                      ],
                    )
                  ]),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  recipeDetail.author.photo == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage('images/avatar.png'),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              NetworkImage(recipeDetail.author.photo),
                        ),
                  const SizedBox(width: 8),
                  Text(
                      '${recipeDetail.author.firstName} ${recipeDetail.author.lastName}',
                      style: itemTitleTextStyle),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('Bahan', style: headingTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${recipeDetail.ingredients.length} bahan',
                          style: subtitleTextStyle)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: recipeDetail.ingredients.length,
                  itemBuilder: (context, index) {
                    return Ingredients(
                        ingredients: recipeDetail.ingredients[index]);
                  }),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('Langkah Memasak', style: headingTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${recipeDetail.steps.length} langkah',
                          style: subtitleTextStyle)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: recipeDetail.steps.length,
                  itemBuilder: (context, index) {
                    return Step(
                        steps: recipeDetail.steps[index], step: index + 1);
                  }),
              SizedBox(
                height: 10.0,
                child: Center(
                  child: Container(
                    height: 1.0,
                    color: grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Ulasan (${recipeDetail.ratings.length})',
                  style: headingTextStyle),
              const SizedBox(height: 16),
              Column(
                children: [
                  if (recipeDetail.ratings.isNotEmpty) ...[
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: recipeDetail.ratings.length,
                          itemBuilder: (context, index) {
                            return Ratings(
                                ratings: recipeDetail.ratings[index]);
                          }),
                    ),
                  ] else ...[
                    const NoReview(),
                  ]
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChipCategories extends StatelessWidget {
  final Categories category;
  const ChipCategories({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        side: BorderSide(
          color: orange,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          category.category,
          style: const TextStyle(fontFamily: font, color: orange, fontSize: 12),
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  final Ingredient ingredients;
  const Ingredients({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Text(ingredients.name, style: blackTextStyle)],
            ),
            Row(
              children: [Text(ingredients.value, style: orangeSmallTextStyle)],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class Step extends StatelessWidget {
  final Steps steps;
  final int step;
  const Step({Key? key, required this.steps, required this.step})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Langkah ${step.toString()}', style: orangeTextStyle),
                  const SizedBox(height: 16),
                  Text(
                    steps.step.toString(),

                    style: blackTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class Ratings extends StatelessWidget {
  final Rating ratings;
  const Ratings({Key? key, required this.ratings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: ratings.rating.toDouble(),
                    allowHalfRating: true,
                    ignoreGestures: true,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rounded,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(width: 6),
                  Text(ratings.rating.toString() + '/5',
                      style: blackBoldTextStyle),
                ],
              ),
              SizedBox(
                height: 10.0,
                child: Center(
                  child: Container(
                    height: 0.8,
                    color: grey,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '"${ratings.review}"',
                style: const TextStyle(
                    fontFamily: font, color: black, fontSize: 12),
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
