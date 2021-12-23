import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:foodpad/provider/review_provider.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:provider/provider.dart';

class DetailBottomNavigation extends StatefulWidget {
  final String recipeId;
  final String name;
  const DetailBottomNavigation(
      {Key? key, required this.recipeId, required this.name})
      : super(key: key);

  @override
  State<DetailBottomNavigation> createState() => _DetailBottomNavigationState();
}

class _DetailBottomNavigationState extends State<DetailBottomNavigation> {
  TextEditingController reviewController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget disabledButton() {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(white),
        backgroundColor: MaterialStateProperty.all<Color>(grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: MediaQuery.of(context).size.width * 0.18,
        ),
        child: const Text(
          'Tulis Ulasan',
          style: TextStyle(fontFamily: font, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double ratingBarValue = 0;
    String _review;

    return ChangeNotifierProvider<ReviewProvider>(
      create: (_) => ReviewProvider(
          apiService: ApiService(), idRecipe: widget.recipeId.toString()),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<ReviewProvider>(builder: (context, state, _) {
                  if (state.state == ResultStateReview.error ||
                      state.state == ResultStateReview.noData) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                          backgroundColor: white,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                height: 335,
                                child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 6),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: grey,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          height: 5,
                                          width: 50,
                                        ),
                                        const SizedBox(height: 12),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text('Tulis Review',
                                                  style: titleTextStyle),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 28.0),
                                                child: Text(
                                                    'Ceritakan pengalamanmu ketika memasak dan mencoba resep ini.',
                                                    style: subtitleTextStyle,
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              const SizedBox(height: 8),
                                              RatingBar.builder(
                                                onRatingUpdate: (newValue) =>
                                                    setState(() {
                                                  ratingBarValue = newValue;
                                                }),
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.orange,
                                                ),
                                                direction: Axis.horizontal,
                                                initialRating: ratingBarValue,
                                                unratedColor:
                                                    const Color(0xFF9E9E9E),
                                                itemCount: 5,
                                                itemSize: 40,
                                                glowColor: orange,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: TextFormField(
                                                  onSaved: (String? review) {
                                                    _review = review!;
                                                  },
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'Ulasan harus diisi';
                                                    }
                                                    return null;
                                                  },
                                                  controller: reviewController,
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'Tulis Ulasan',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              ElevatedButton(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.27,
                                                  ),
                                                  child: const Text(
                                                    'Kirim Ulasan',
                                                    style: TextStyle(
                                                        fontFamily: font,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(white),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(orange),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    if (ratingBarValue == 0) {
                                                      showDialog<String>(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                            'Gagal mengirim review',
                                                            style:
                                                                titleTextStyle,
                                                          ),
                                                          content: const Text(
                                                              'Pastikan kamu sudah memberi bintang dan memasukkan ulasan yang sesuai!',
                                                              style:
                                                                  blackTextStyle),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Tutup',
                                                                  style:
                                                                      orangeSmallTextStyle),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    } else {
                                                      state.addReview(
                                                          ratingBarValue,
                                                          reviewController
                                                              .text);
                                                      Future.delayed(
                                                          const Duration(
                                                              seconds: 1), () {
                                                        Navigator.pop(context);
                                                        Navigator
                                                            .pushReplacement(
                                                                context,
                                                                PageRouteBuilder(
                                                                    pageBuilder: (a,
                                                                            b,
                                                                            c) =>
                                                                        DetailPage(
                                                                          recipeId:
                                                                              widget.recipeId,
                                                                          name:
                                                                              widget.name,
                                                                        ),
                                                                    transitionDuration:
                                                                        const Duration(
                                                                            seconds:
                                                                                0)));
                                                      });
                                                      Future.value();
                                                    }
                                                  } else {}
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: MediaQuery.of(context).size.width * 0.18,
                        ),
                        child: const Text(
                          'Tulis Ulasan',
                          style: TextStyle(fontFamily: font, fontSize: 16),
                        ),
                      ),
                    );
                  } else if (state.state == ResultStateReview.loading) {
                    return disabledButton();
                  } else {
                    return disabledButton();
                  }
                }),
              ],
            ),
            Row(
              children: [
                FavoriteButton(
                  recipeId: widget.recipeId,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.recipeId}) : super(key: key);

  final String recipeId;
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteCheckProvider>(
      create: (_) => FavoriteCheckProvider(
          apiService: ApiService(), idRecipe: widget.recipeId.toString()),
      child: Consumer<FavoriteCheckProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(color: orange),
            );
          } else if (state.state == ResultState.hasData) {
            return IconButton(
              icon: const Icon(Icons.favorite, color: orange, size: 36),
              onPressed: () {
                state.deleteFavorite(
                    (state.favoriteResult.data![0].id!).toString());
                var snackBarFalse = const SnackBar(
                  content: Text(
                    'Resep dihapus dari favorite',
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarFalse);
                });
              },
            );
          } else if (state.state == ResultState.noData) {
            return const Text('no data');
          } else {
            return IconButton(
              icon: const Icon(Icons.favorite_border, color: orange, size: 36),
              onPressed: () {
                state.addFavorite(widget.recipeId.toString());
                var snackBarTrue = const SnackBar(
                  content: Text(
                    'Resep ditambahkan ke favorite.',
                  ),
                );
                Future.delayed(const Duration(seconds: 1), () {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarTrue);
                });
              },
            );
          }
        },
      ),
    );
  }
}
