import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class RecipeDonePage extends StatelessWidget {
  const RecipeDonePage({Key? key}) : super(key: key);

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
      body: Center(
        child: Text('Receipt Done Page', style: textStyle),
      ),
    );
  }
}
