import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/ingredients_homepage.dart';
import 'package:foodpad/ui/home/ingredients_list_page.dart';
import 'package:foodpad/ui/search_page.dart';

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
              children: const [
                Text('Punya Bahan Apa?', style: headingTextStyle),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, IngredientsListPage.routeName),
                  child: const Text('Lihat Semua', style: orangeSmallTextStyle),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigation.intentWithData(
                                  SearchPage.routeName, ingredients[index]);
                              Fluttertoast.showToast(
                                  msg: "${ingredients[index]} clicked.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 3,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 28,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                        'images/${ingredientsIcon[index]}'))),
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
        const SizedBox(height: 8),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          InkWell(
                            child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 28,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                        'images/${ingredientsIcon[index + 5]}'))),
                          ),
                          const SizedBox(height: 4),
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
        const SizedBox(height: 28),
      ],
    );
  }
}
