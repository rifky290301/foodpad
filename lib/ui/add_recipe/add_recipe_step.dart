import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/main_page.dart';

class AddRecipeStep extends StatefulWidget {
  const AddRecipeStep({Key? key, required this.recipeId}) : super(key: key);
  static const routeName = '/add_recipe_step_page';

  final String recipeId;

  @override
  _AddRecipeStepState createState() => _AddRecipeStepState();
}

class _AddRecipeStepState extends State<AddRecipeStep> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<StepForm> listStep = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addStepForm();
  }

  addStepForm() {
    listStep.add(StepForm(
      recipeId: widget.recipeId,
    ));
    setState(() {});
  }

  void store(step) {
    ApiService.addStep(step, widget.recipeId);
  }

  submitStep() async {
    for (var widget in listStep) {
      await Future.delayed(const Duration(seconds: 2), () {
        store(widget.recipeStepController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: orange,
        onPressed: () {
          addStepForm();
        },
        child: const Icon(Icons.add_rounded, size: 32),
      ),
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
                          'Langkah Memasak',
                          style: helloTextStyle,
                        ),
                        Text(
                          'Masukkan langkah memasaknya di sini',
                          style: TextStyle(fontFamily: font, color: black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: listStep.length,
                      itemBuilder: (context, index) {
                        return listStep[index];
                      }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 32),
                            child: Text('Unggah Resep',
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
                              submitStep();

                              Future.delayed(const Duration(seconds: 1), () {
                                showDialog<String>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Berhasil Menggungah Resep',
                                      style: titleTextStyle,
                                    ),
                                    content: const Text(
                                        'Yay! Resepmu sudah berhasil diunggah ke aplikasi ini untuk dibagikan ke teman-teman FoodPad lainnya!',
                                        style: blackTextStyle),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.popAndPushNamed(
                                              context, MainPage.routeName);
                                        },
                                        child: const Text('Tutup',
                                            style: orangeSmallTextStyle),
                                      ),
                                    ],
                                  ),
                                );
                              });
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

class StepForm extends StatelessWidget {
  StepForm({Key? key, required this.recipeId}) : super(key: key);

  final String recipeId;

  TextEditingController recipeStepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFE6E6E6),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: TextFormField(
                minLines: 3,
                maxLines: 4,
                controller: recipeStepController,
                cursorColor: orange,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Langkah memasak harus diisi';
                  }
                  return null;
                },
                style: blackTextStyle,
                decoration: const InputDecoration(
                  hintStyle: subtitleTextStyle,
                  hintText: "Langkah Memasak",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
