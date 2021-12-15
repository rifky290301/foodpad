import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/error.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:foodpad/ui/home/ingredient_recipe_page.dart';
import 'package:foodpad/widgets/action_bar.dart';
import 'package:provider/provider.dart';

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
          title: const ActionBarNoMenu('Bahan-bahan'),
        ),
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ChangeNotifierProvider<CategoryProvider>(
                      create: (_) => CategoryProvider(apiService: ApiService()),
                      child: Consumer<CategoryProvider>(
                        builder: (context, state, _) {
                          if (state.state == ResultStates.loading) {
                            return const Center(
                              child: CircularProgressIndicator(color: orange),
                            );
                          } else if (state.state == ResultStates.hasData) {
                            return Column(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount:
                                        state.categoryResult.data!.length,
                                    itemBuilder: (context, index) {
                                      var category = state.categoryResult
                                          .data![index].category!;

                                      return InkWell(
                                        onTap: () {
                                          Navigation.intentWithData(
                                              IngredientRecipePage.routeName,
                                              category);
                                        },
                                        child: ListTile(
                                          title: Text(
                                            category.toUpperCase(),
                                            style: const TextStyle(
                                                fontFamily: font),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            );
                          } else if (state.state == ResultStates.error) {
                            return const ErrorLoad();
                          } else {
                            return const NoInternet();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
