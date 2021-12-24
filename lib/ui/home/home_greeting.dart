import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/settings/account_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  String? _firstName = '';

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('firstName');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _firstName == null || _firstName!.isEmpty
                    ? const Text("Halo, User", style: helloTextStyle)
                    : Text("Halo, $_firstName", style: helloTextStyle),
                const Text(
                  'Mau masak apa hari ini?',
                  style: TextStyle(fontFamily: font, color: black),
                ),
              ]),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AccountSettingsPage.routeName);
                },
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'images/avatar.png',
                    ),
                  ),
                  radius: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
