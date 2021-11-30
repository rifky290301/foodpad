import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/favorite_page.dart';
import 'package:foodpad/ui/home/home_page.dart';
import 'package:foodpad/ui/search_page.dart';
import 'package:foodpad/ui/settings/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main_page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded, size: 26),
      title: Text('Beranda', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search, size: 24),
      title: Text('Cari', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_rounded, size: 24),
      title: Text('Favorit', style: TextStyle(fontFamily: font)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings, size: 24),
      title: Text(
        'Pengaturan',
        style: TextStyle(fontFamily: font),
      ),
    ),
  ];

  final List<Widget> _listWidget = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavIndex,
          type: BottomNavigationBarType.fixed,
          items: _bottomNavBarItems,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (selected) {
            setState(() {
              bottomNavIndex = selected;
            });
          }),
    );
  }
}
