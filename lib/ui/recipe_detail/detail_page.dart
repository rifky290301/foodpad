import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/recipe_detail/data_detail.dart';
import 'package:foodpad/ui/recipe_detail/detail_bottom_navigation.dart';
import 'package:foodpad/widgets/action_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.recipeId}) : super(key: key);
  static const routeName = '/detail_page';

  final String recipeId;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

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
        title: ActionBar("Resep", widget.recipeId.toString()),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ChangeNotifierProvider<RecipeDetailProvider>(
              create: (_) => RecipeDetailProvider(
                  apiService: ApiService(), id: widget.recipeId),
              child:
                  Consumer<RecipeDetailProvider>(builder: (context, state, _) {
                if (state.state == ResultStates.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: orange),
                  );
                } else if (state.state == ResultStates.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return DataDetail(
                          recipeDetail: state.recipeResult.recipes[index],
                          recipeId: widget.recipeId,
                        );
                      });
                } else if (state.state == ResultStates.error) {
                  return const ErrorLoad();
                } else {
                  return const ErrorLoad();
                }
              }),
            ),
          ),
        ),
      ),
      bottomNavigationBar: DetailBottomNavigation(
        recipeId: widget.recipeId,
      ),
    );
  }
}
