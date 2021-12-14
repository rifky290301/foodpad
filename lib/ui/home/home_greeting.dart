import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/settings/account_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Greeting extends StatefulWidget {
  Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  String? _firstName = '';
  String? _photo = '';

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('firstName');
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Halo, $_firstName", style: helloTextStyle),
              Text(
                'Mau masak apa hari ini?',
                style: const TextStyle(fontFamily: font, color: black),
              ),
            ]),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AccountSettingsPage.routeName);
            },
            child: Flexible(
              flex: 1,
              child: _photo == null || _photo!.isEmpty
                  ? CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'images/logo.png',
                        ),
                      ),
                      radius: 28,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                        _photo!,
                      ),
                      radius: 28,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
