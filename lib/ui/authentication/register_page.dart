import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/authentication/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool passwordVisibility = true;
  bool confirmPasswordVisibility = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String _firstName, _lastName, _email, _pass;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: orange,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: orange,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Buat Akun',
                                            style: titleTextStyle,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Silahkan buat akun untuk memulai.',
                                            style: TextStyle(
                                              fontFamily: font,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      //First Name
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 330,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: lightGrey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: TextFormField(
                                                  controller:
                                                      firstNameController,
                                                  obscureText: false,
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'Nama depan harus diisi';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (String? firstName) {
                                                    _firstName = firstName!;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Nama Depan',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: greyTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      //Last Name
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 330,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: lightGrey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: TextFormField(
                                                  controller:
                                                      lastNameController,
                                                  obscureText: false,
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'Nama belakang harus diisi';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (String? lastName) {
                                                    _lastName = lastName!;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Nama Belakang',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: greyTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      //Email
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 330,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: lightGrey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: TextFormField(
                                                  controller: emailController,
                                                  obscureText: false,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  validator: (String? value) {
                                                    bool isEmailValid = RegExp(
                                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(value!);
                                                    if (value.isEmpty) {
                                                      return 'Email harus diisi';
                                                    } else if (!isEmailValid) {
                                                      return 'Masukkan email dengan benar';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (String? email) {
                                                    _email = email!;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Email',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: greyTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      //Password
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 330,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: lightGrey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: TextFormField(
                                                  controller: passController,
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'Kata sandi harus diisi';
                                                    }
                                                    if (value.length < 8) {
                                                      return 'Kata sandi minimal 8 karakter';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (String? pass) {
                                                    _pass = pass!;
                                                  },
                                                  obscureText:
                                                      !passwordVisibility,
                                                  decoration: InputDecoration(
                                                    hintText: 'Kata Sandi',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => passwordVisibility =
                                                            !passwordVisibility,
                                                      ),
                                                      child: Icon(
                                                        passwordVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  style: greyTextStyle,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      //Confirm Password
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 330,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: lightGrey,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: TextFormField(
                                                  controller:
                                                      confirmPassController,
                                                  obscureText:
                                                      !confirmPasswordVisibility,
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'Harap konfirmasi kata sandi';
                                                    } else if (value !=
                                                        passController.text) {
                                                      return 'Kata sandi tidak cocok';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Konfirmasi Kata Sandi',
                                                    hintStyle:
                                                        subtitleTextStyle,
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => confirmPasswordVisibility =
                                                            !confirmPasswordVisibility,
                                                      ),
                                                      child: Icon(
                                                        confirmPasswordVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  style: greyTextStyle,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(orange),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ))),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            showDialog<String>(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                  'Berhasil',
                                                  style: titleTextStyle,
                                                ),
                                                content: const Text(
                                                    'Yes! Kamu sudah berhasil membuat akun FoodPad. Kamu sudah bisa masuk sekarang!',
                                                    style: blackTextStyle),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.popAndPushNamed(
                                                          context,
                                                          LoginPage.routeName);
                                                    },
                                                    child: const Text('Masuk',
                                                        style:
                                                            orangeSmallTextStyle),
                                                  ),
                                                ],
                                              ),
                                            );
                                            return;
                                          } else {}
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 64),
                                          child: Text('Buat Akun',
                                              style: TextStyle(
                                                  fontFamily: font,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  '© 2021 FoodPad. All rights reserved.',
                  style: TextStyle(
                    fontFamily: font,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
