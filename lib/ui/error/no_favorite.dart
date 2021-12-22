import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/home/trending_list_page.dart';

class NoFavorite extends StatelessWidget {
  const NoFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.subtitles_off_outlined, color: grey, size: 100),
            const SizedBox(height: 8),
            const Text('Belum Ada Favorit', style: titleTextStyle),
            const Text(
              'Ayo mulai cari resep makanan kesukaanmu dari sekarang.',
              textAlign: TextAlign.center,
              style: subtitleTextStyle,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                Navigator.pushNamed(context, TrendingListPage.routeName);
              },

              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text('Eksplor Resep',
                    style: TextStyle(fontFamily: font, fontSize: 14)),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
