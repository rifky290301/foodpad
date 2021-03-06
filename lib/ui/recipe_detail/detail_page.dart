import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:foodpad/ui/recipe_detail/data_detail.dart';
import 'package:foodpad/ui/recipe_detail/detail_bottom_navigation.dart';
import 'package:foodpad/widgets/action_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.recipeId, required this.name})
      : super(key: key);
  static const routeName = '/detail_page';

  final String recipeId;
  final String name;

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
        title: ActionBar(
            pageName: "Resep",
            recipeId: widget.recipeId.toString(),
            name: widget.name),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (a, b, c) =>
                      DetailPage(recipeId: widget.recipeId, name: widget.name),
                  transitionDuration: const Duration(seconds: 0)));
          return Future.value();
        },
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ChangeNotifierProvider<RecipeDetailProvider>(
                create: (_) => RecipeDetailProvider(
                    apiService: ApiService(), id: widget.recipeId),
                child: Consumer<RecipeDetailProvider>(
                    builder: (context, state, _) {
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
                            recipeDetail: state.recipeResult.data[index],
                            recipeId: widget.recipeId,
                          );
                        });
                  } else if (state.state == ResultStates.error) {
                    return const ErrorLoad();
                  } else {
                    return const NoInternet();
                  }
                }),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          DetailBottomNavigation(recipeId: widget.recipeId, name: widget.name),
    );
  }
}
