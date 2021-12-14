import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class DetailBottomNavigation extends StatelessWidget {
  final String recipeId;
  const DetailBottomNavigation({Key? key, required this.recipeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  backgroundColor: MaterialStateProperty.all<Color>(orange),
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
                    'Mulai Memasak',
                    style: TextStyle(fontFamily: font, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              FavoriteButton(
                recipeId: recipeId,
              ),
            ],
          ),
        ],
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
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // FavoriteCheckProvider instanceFavorite = FavoriteCheckProvider(
    //     apiService: ApiService(), idRecipe: widget.recipeId.toString());
    // return IconButton(
    //   icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
    //       color: orange, size: 34),
    //   onPressed: () {
    //     setState(
    //       () {
    //         isFavorite = !isFavorite;
    //         const snackBarTrue = SnackBar(
    //           content: Text('Restoran ditambahkan ke favorite.'),
    //         );

    //         const snackBarFalse =
    //             SnackBar(content: Text('Restoran dihapus dari favorite.'));

    //         isFavorite
    //             ? ScaffoldMessenger.of(context).showSnackBar(snackBarTrue)
    //             : ScaffoldMessenger.of(context).showSnackBar(snackBarFalse);
    //       },
    //     );
    //   },
    // );
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
              icon: const Icon(Icons.favorite, color: orange, size: 34),
              onPressed: () {
                state.deleteFavorite(
                    (state.favoriteResult.data![0].id!).toString());
                setState(() {
                  var snackBarFalse = const SnackBar(
                    content: Text(
                      'Resep dihapus dari favorite',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarFalse);
                });
              },
            );
          } else if (state.state == ResultState.noData) {
            return const Text('no data');
          } else {
            return IconButton(
              icon: const Icon(Icons.favorite_border, color: orange, size: 34),
              onPressed: () {
                state.addFavorite(widget.recipeId.toString());
                setState(() {
                  var snackBarTrue = const SnackBar(
                    content: Text(
                      'Resep ditambahkan ke favorite.',
                    ),
                  );
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
