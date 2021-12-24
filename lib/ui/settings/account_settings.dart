import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  static const routeName = '/profile_page';

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String? _firstName = '';
  String? _lastName = '';
  String? _email = '';
  String? _photo = '';

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('firstName');
      _lastName = prefs.getString('lastName');
      _email = prefs.getString('email');
      _photo = prefs.getString('profilePicture');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

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
            const Text("Profil Akun", style: titleTextStyle)
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          _photo == null || _photo!.isEmpty
              ? Image.asset(
                  'images/avatar.png',
                  fit: BoxFit.fill,
                )
              : Image.network(
                  _photo!,
                  fit: BoxFit.fill,
                ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Text(
                  "Nama : $_firstName $_lastName",
                  style: blackTextStyle.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Email : $_email",
                  style: blackTextStyle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
