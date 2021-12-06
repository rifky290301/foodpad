import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/widgets/action_bar.dart';

class IngredientsListPage extends StatefulWidget {
  const IngredientsListPage({Key? key}) : super(key: key);

  static const routeName = '/ingredient_list_page';
  @override
  _IngredientsListPageState createState() => _IngredientsListPageState();
}

class _IngredientsListPageState extends State<IngredientsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: black,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const ActionBar("Bahan-Bahan"),
      ),
      body: Center(
        child: Text('Ingredients Page'),
      ),
    );
  }
}
