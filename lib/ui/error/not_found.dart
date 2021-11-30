import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.search_off, color: grey, size: 125),
              SizedBox(height: 8),
              Text('Tidak Ditemukan', style: titleTextStyle),
              Text(
                'Kami tidak dapat menemukan hasil pencarian dari "babi halal"',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: font, color: grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
