import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/widgets/action_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const routeName = '/detail_page';
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: black,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: ActionBar("Resep"),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
                'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Spageti Seafood Pedas', style: titleTextStyle),
                  SizedBox(height: 16),
                  Text(
                      'Spageti Pedas dengan ayam, telur goreng, kerang, dan daun-daunan herbal. Disajikan dengan seiris lemon dan daun basil.',
                      style: subtitleTextStyle),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.microwave_rounded,
                                size: 36, color: Colors.black45),
                            Text(
                              '15 Menit',
                              style: orangeTextStyle,
                            ),
                            Text('Persiapan', style: textStyle),
                          ],
                        )
                      ]),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time_rounded,
                                size: 32, color: Colors.black45),
                            Text('45 Menit', style: orangeTextStyle),
                            Text('Memasak', style: textStyle),
                          ],
                        )
                      ]),
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.description_rounded,
                                size: 34, color: Colors.black45),
                            Text('Mudah', style: orangeTextStyle),
                            Text('Kesulitan', style: textStyle),
                          ],
                        )
                      ]),
                    ],
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Bahan', style: headingTextStyle),
                        ],
                      ),
                      Row(
                        children: [Text('6 bahan', style: subtitleTextStyle)],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  DummyIngredients(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                      child: Text('Mulai Memasak',
                          style: TextStyle(fontFamily: font, fontSize: 16)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  FavoriteButton(),
                ],
              )
            ],
          )),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: orange, size: 34),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
          const snackBarTrue = SnackBar(
            content: Text('Restoran ditambahkan ke favorite.'),
          );

          const snackBarFalse =
              SnackBar(content: Text('Restoran dihapus dari favorite.'));

          isFavorite
              ? ScaffoldMessenger.of(context).showSnackBar(snackBarTrue)
              : ScaffoldMessenger.of(context).showSnackBar(snackBarFalse);
        });
      },
    );
  }
}

class DummyIngredients extends StatelessWidget {
  const DummyIngredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Daun Basil'),
              ],
            ),
            Row(
              children: [Text('10gr', style: orangeSmallTextStyle)],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Telur'),
              ],
            ),
            Row(
              children: [Text('2 buah', style: orangeSmallTextStyle)],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Air'),
              ],
            ),
            Row(
              children: [Text('200ml', style: orangeSmallTextStyle)],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Dada Ayam'),
              ],
            ),
            Row(
              children: [Text('100gr', style: orangeSmallTextStyle)],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Pasta'),
              ],
            ),
            Row(
              children: [Text('Secukupnya', style: orangeSmallTextStyle)],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('Garam'),
              ],
            ),
            Row(
              children: [Text('2 sdp', style: orangeSmallTextStyle)],
            ),
          ],
        ),
      ],
    );
  }
}
