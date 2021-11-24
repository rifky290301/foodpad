import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, size: 100, color: lightGray),
              const SizedBox(height: 8),
              const Text('Tidak Ada Internet', style: titleTextStyle),
              const Text(
                'Saat ini perangkatmu tidak terhubung ke internet. Harap periksa lalu coba lagi.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: font, color: gray),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Coba Lagi',
                      style: TextStyle(fontFamily: font, fontSize: 14)),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
