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
      body: const Center(
        child: Text('About Us Page'),
      ),
    );
  }
}
