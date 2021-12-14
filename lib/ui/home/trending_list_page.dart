import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/ui/home/card_trending.dart';
import 'package:foodpad/widgets/action_bar.dart';
import 'package:provider/provider.dart';

class TrendingListPage extends StatefulWidget {
  const TrendingListPage({Key? key}) : super(key: key);

  static const routeName = '/trending_list_page';
  @override
  TrendingListPageState createState() => TrendingListPageState();
}

class TrendingListPageState extends State<TrendingListPage> {
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
        title: ActionBar("Trending"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Text('trending page')],
          ),
        ),
      ),
    );
  }

  _buildTrendingList(BuildContext context) {
    Consumer<TrendingProvider>(
      builder: (context, state, _) {
        if (state.state == ResultStates.loading) {
          return const Center(child: CircularProgressIndicator(color: orange));
        } else {
          if (state.state == ResultStates.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  var recipe = state.recipeResult.data![index];
                  return HomeCardTrending(recipe: recipe);
                });
          } else if (state.state == ResultStates.noData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultStates.error) {
            return Center(child: Text(state.message));
          } else {
            return const Text('');
          }
        }
      },
    );
  }
}
