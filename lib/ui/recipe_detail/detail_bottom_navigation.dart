import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class DetailBottomNavigation extends StatelessWidget {
  const DetailBottomNavigation({Key? key}) : super(key: key);

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
                      ))),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width * 0.18),
                    child: const Text('Mulai Memasak',
                        style: TextStyle(fontFamily: font, fontSize: 16)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                FavoriteButton(),
              ],
            ),
          ],
        ));
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

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
