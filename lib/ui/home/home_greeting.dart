import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Greeting extends StatefulWidget {
  Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  late String _firstName;
  late String _photo;
  Future<String> getPrefs(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

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
    getPrefs('firstName').then((value) => setFirstrName(value));
    getPrefs('profilePicture').then((value) => setPhoto(value));
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
                Text("Halo, $_firstName,", style: helloTextStyle),
                Text('Mau masak apa hari ini?',
                    style: TextStyle(fontFamily: font, color: black)),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child:
                // if (_photo == null) {
                //   Te
                // } else {
                CircleAvatar(
                    backgroundImage: NetworkImage(
                      _photo,
                      // return _photo
                    ),
                    radius: 28),
          ),
        ],
      ),
    );
  }
}
