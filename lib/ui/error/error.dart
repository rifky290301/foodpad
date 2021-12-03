import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class ErrorLoad extends StatefulWidget {
  const ErrorLoad({Key? key}) : super(key: key);

  @override
  _ErrorLoadState createState() => _ErrorLoadState();
}

class _ErrorLoadState extends State<ErrorLoad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: const [
                Icon(Icons.warning_amber_rounded, color: grey, size: 125),
                SizedBox(height: 8),
                Text('Terjadi Kesalahan', style: titleTextStyle),
                Text(
                  'Saat ini resep tidak dapat dimuat. Silahkan coba lagi nanti',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: font, color: grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
