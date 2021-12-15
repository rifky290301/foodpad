import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsPage extends StatefulWidget {
  AccountSettingsPage({Key? key}) : super(key: key);

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
            Text("Profil")
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          _photo == null || _photo!.isEmpty
              ? Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fill,
                )
              : Image.network(
                  _photo!,
                  fit: BoxFit.fill,
                ),
          // Image.asset("images/logo.png", fit: BoxFit.fill),
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
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Scrollbar(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: ListView(
                controller: scrollController,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Nama : $_firstName $_lastName",
                      style: blackTextStyle.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: Text(
                      "Email : $_email",
                      style: blackTextStyle,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      primary: false,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 5.0,
                      crossAxisCount: 3,
                      children: [
                        /* total murid */
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 90.0,
                              width: 90.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    size: 35.0,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "10 Favorit",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 12.0),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        /* pelatihan */
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 90.0,
                              width: 90.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.kitchen_rounded,
                                    size: 35.0,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "40 Resep",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 9.0),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        /* medal */
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              height: 90.0,
                              width: 90.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.reviews_outlined,
                                    size: 35.0,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "Ulasan",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 12.0),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    child: Text(
                      "Tentang",
                      style: blackTextStyle.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
