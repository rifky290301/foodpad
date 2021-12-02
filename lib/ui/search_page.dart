import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/models/ingredients_homepage.dart';
import 'package:foodpad/models/recipe_model.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/error/no_internet.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = '/search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Pencarian', style: helloTextStyle),
                              Text('Mau cari resep apa?',
                                  style: blackTextStyle),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: TextFormField(
                                  // controller: controller.searchController,
                                  cursorColor: orange,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (query) {
                                    // controller.searchController.text = query;
                                    // controller.searchRestaurant();
                                  },
                                  style: blackTextStyle,
                                  decoration: InputDecoration(
                                    labelStyle: subtitleTextStyle,
                                    labelText: "Cari resep",
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: orange,
                                      ),
                                      onPressed: () {
                                        // controller.searchRestaurant();
                                      },
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Kategori', style: itemTitleTextStyle),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: _buildCategory(context),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator(color: orange));
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: state.categoryResult.category.category.length,
            itemBuilder: (context, index) {
              var categories = state.categoryResult.category.category[index];
              return Card(
                color: orange,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    categories,
                    style: TextStyle(fontFamily: font, color: white),
                  ),
                ),
              );
            },
          );
        } else if (state.state == ResultState.error) {
          return const Center(child: Text('Error', style: subtitleTextStyle));
        } else {
          return const Text('');
        }
      },
    );
  }
}
