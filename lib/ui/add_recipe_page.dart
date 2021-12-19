import 'package:flutter/material.dart';
import 'package:foodpad/common/styles.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({Key? key}) : super(key: key);

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController pictureURLController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController prepareTimeController = TextEditingController();
  TextEditingController cookTimeController = TextEditingController();
  String? _dropdownValue = 'Mudah';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    recipeNameController = TextEditingController();
    pictureURLController = TextEditingController();
    descriptionController = TextEditingController();
    prepareTimeController = TextEditingController();
    cookTimeController = TextEditingController();
  }

  var _difficulties = ["Mudah", "Sedang", "Sulit"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tambah Resep',
                          style: helloTextStyle,
                        ),
                        Text(
                          'Ayo bagikan resep andalanmu di sini!',
                          style: TextStyle(fontFamily: font, color: black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: TextFormField(
                        controller: recipeNameController,
                        cursorColor: orange,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Nama resep harus diisi';
                          }
                          return null;
                        },
                        style: blackTextStyle,
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "Nama Resep",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: TextFormField(
                        controller: pictureURLController,
                        cursorColor: orange,
                        keyboardType: TextInputType.text,
                        style: blackTextStyle,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'URL gambar harus diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "URL Gambar",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 132,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: TextFormField(
                        controller: descriptionController,
                        cursorColor: orange,
                        minLines: 3,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        style: blackTextStyle,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Deskripsi harus diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Deskripsi",
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: TextFormField(
                        controller: prepareTimeController,
                        cursorColor: orange,
                        keyboardType: TextInputType.number,
                        style: blackTextStyle,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Waktu persiapan memasak harus diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "Waktu Persiapan Memasak (Menit)",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: TextFormField(
                        controller: cookTimeController,
                        cursorColor: orange,
                        keyboardType: TextInputType.number,
                        style: blackTextStyle,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Waktu memasak harus diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "Waktu Memasak (Menit)",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: _dropdownValue == 'Mudah',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _dropdownValue,
                            style: const TextStyle(color: Colors.deepPurple),
                            onChanged: (String? newValue) {
                              setState(() {
                                _dropdownValue = newValue;
                                print(newValue);
                              });
                            },
                            items: <String>['Mudah', 'Sedang', 'Sulit']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: blackTextStyle),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 32),
                            child: Text('Lanjutkan',
                                style:
                                    TextStyle(fontFamily: font, fontSize: 16)),
                          ),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(orange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('OK');
                              return;
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Gagal Menambah Resep',
                                    style: titleTextStyle,
                                  ),
                                  content: const Text(
                                      'Resep tidak dapat ditambah. Silahkan coba lagi atau periksa bahwa data resep yang dibutuhkan sudah sesuai.',
                                      style: blackTextStyle),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Tutup',
                                          style: orangeSmallTextStyle),
                                    ),
                                  ],
                                ),
                              );
                              return;
                            }
                            ;
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
