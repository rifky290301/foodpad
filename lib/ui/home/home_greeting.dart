import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Greeting extends StatefulWidget {
  Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  late String _firstName;
  late String _photo;

  setFirstrName(val) {
    setState(() {
      _firstName = val;
    });
  }

  setPhoto(val) {
    setState(() {
      _photo = val;
    });
  }

  @override
  void initState() {
    super.initState();
    AuthProvider.getPrefs('firstName').then((value) => setFirstrName(value));
    AuthProvider.getPrefs('profilePicture').then((value) => setPhoto(value));
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _firstName != null
                    ? Text("Halo, $_firstName,", style: helloTextStyle)
                    : Text("belum ada nama"),
                const Text(
                  'Mau masak apa hari ini?',
                  style: TextStyle(fontFamily: font, color: black),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: _photo != null || _photo.isEmpty
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
                      _photo,
                    ),
                    radius: 28,
                  ),
          ),
        ],
      ),
    );
  }
}
