import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  static const routeName = '/about_us_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: black,
          automaticallyImplyLeading: false,
          backgroundColor: white,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/logo.png', width: 120),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('"FoodPad App" Capstone Project',
                                  style: titleTextStyle),
                              SizedBox(height: 12),
                              Text('dibuat oleh CSD-054',
                                  style: subtitleTextStyle),
                              Text('Android & Multi-Platform',
                                  style: subtitleTextStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text('Tentang Aplikasi', style: titleTextStyle),
                const SizedBox(height: 8),
                const Text(
                  '         Dalam aplikasi resep makanan, pengguna seringkali dihadapi dengan resep yang begitu banyak, namun jarang yang benar-benar sesuai dengan kebutuhan mereka berdasarkan ketersediaan bahan yang mereka punya.\n\n        Menanggapi hal tersebut, kami menemukan bahwa lebih baik jika sebuah aplikasi dapat menyediakan resep yang sesuai dengan bahan yang dimiliki oleh pengguna saat itu juga untuk memasak disesuaikan dengan bahan, lama memasak, dan tingkat kesulitannya. Pengguna juga bisa menyimpan resep yang supaya tidak kesulitan mencari ulang resep tersebut setiap kali membuka aplikasi.',
                  style: subtitleTextStyle,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 28),
                const Text('Tujuan Aplikasi', style: titleTextStyle),
                const SizedBox(height: 8),
                const Text(
                  '         Membantu orang menemukan resep masakan yang sesuai dengan kebutuhan dan ketersediaan bahan dari pengguna. Diharapkan juga aplikasi ini dapat menjangkau pemula juga untuk meningkatkan semangat belajar memasak sendiri dan mengurangi jajan jajanan/makanan yang dirasa kurang sehat ataupun mahal.',
                  style: subtitleTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )),
        ));
  }
}
