import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/ingredients_homepage.dart';
import 'package:foodpad/ui/home/ingredients_list_page.dart';

class HomeIngredientsList extends StatelessWidget {
  const HomeIngredientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Punya Bahan Apa?', style: headingTextStyle),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, IngredientsListPage.routeName),
                  child: Text('Lihat Semua', style: orangeSmallTextStyle),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.center,
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: gray,
                            radius: 28,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            ingredients[index],
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        SizedBox(height: 8),
        Container(
          alignment: Alignment.center,
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: gray,
                            radius: 28,
                          ),
                          SizedBox(height: 4),
                          Text(
                            ingredients[index + 5],
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
        SizedBox(height: 28),
      ],
    );
  }
}
