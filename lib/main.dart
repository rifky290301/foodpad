import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/provider/preferences_provider.dart';
import 'package:foodpad/provider/recipe_provider.dart';
import 'package:foodpad/provider/scheduling_provider.dart';
import 'package:foodpad/ui/add_recipe/add_recipe_ingredient_page.dart';
import 'package:foodpad/ui/add_recipe/add_recipe_step.dart';
import 'package:foodpad/ui/authentication/register_page.dart';
import 'package:foodpad/ui/favorite_page.dart';
import 'package:foodpad/ui/home/ingredient_recipe_page.dart';
import 'package:foodpad/ui/home/ingredients_list_page.dart';
import 'package:foodpad/ui/home/trending_list_page.dart';
import 'package:foodpad/ui/authentication/login_page.dart';
import 'package:foodpad/ui/recipe_detail/detail_page.dart';
import 'package:foodpad/ui/home/home_page.dart';
import 'package:foodpad/ui/main_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:flutter/services.dart';
import 'package:foodpad/ui/settings/account_settings.dart';
import 'package:foodpad/ui/splash_screen.dart';
import 'package:foodpad/utils/background_service.dart';
import 'package:foodpad/utils/notification_helper.dart';
import 'package:foodpad/utils/preferences_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  await AndroidAlarmManager.initialize();
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CategoryProvider(apiService: ApiService())),
        ChangeNotifierProvider(
            create: (_) => RecipeProvider(apiService: ApiService())),
        ChangeNotifierProvider(
            create: (_) => TrendingProvider(apiService: ApiService())),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'FoodPad',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            home: const SplashScreen(),
            navigatorKey: navigatorKey,
            routes: {
              MainPage.routeName: (context) => const MainPage(),
              LoginPage.routeName: (context) => const LoginPage(),
              RegisterPage.routeName: (context) => const RegisterPage(),
              HomePage.routeName: (context) => const HomePage(),
              DetailPage.routeName: (context) => DetailPage(
                  recipeId:
                      ModalRoute.of(context)?.settings.arguments as String),
              SearchPage.routeName: (context) => const SearchPage(),
              AccountSettingsPage.routeName: (context) =>
                  const AccountSettingsPage(),
              IngredientsListPage.routeName: (context) =>
                  const IngredientsListPage(),
              TrendingListPage.routeName: (context) => const TrendingListPage(),
              FavoritePage.routeName: (context) => const FavoritePage(),
              AddRecipeIngredient.routeName: (context) => AddRecipeIngredient(
                  recipeId:
                      ModalRoute.of(context)?.settings.arguments as String),
              AddRecipeStep.routeName: (context) => AddRecipeStep(
                  recipeId:
                      ModalRoute.of(context)?.settings.arguments as String),
              MainFavoritePage.routeName: (context) => const MainFavoritePage(),
              IngredientRecipePage.routeName: (context) => IngredientRecipePage(
                  category:
                      ModalRoute.of(context)?.settings.arguments as String),
            },
          );
        },
      ),
    );
  }
}
