import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class NoReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: const [
                Icon(Icons.warning_amber_rounded, color: grey, size: 75),
                SizedBox(height: 8),
                Text('Belum Ada Ulasan', style: itemTitleTextStyle),
                Text(
                  'Jadilah orang yang pertama untuk mengulas resep ini dan ceritakan pengalaman memasakmu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: font, color: grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
