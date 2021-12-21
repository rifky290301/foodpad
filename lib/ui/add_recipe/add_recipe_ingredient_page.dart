import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/common/navigation.dart';
import 'package:foodpad/common/styles.dart';
import 'package:foodpad/ui/add_recipe/add_recipe_step.dart';

class AddRecipeIngredient extends StatefulWidget {
  const AddRecipeIngredient({Key? key, required this.recipeId})
      : super(key: key);
  static const routeName = '/add_recipe_ingredient_page';

  final String recipeId;

  @override
  _AddRecipeIngredientState createState() => _AddRecipeIngredientState();
}

class IngredientForm extends StatefulWidget {
  IngredientForm({Key? key, required this.recipeId}) : super(key: key);

  final String recipeId;

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  bool isSend = true;

  TextEditingController ingredientController = TextEditingController();
  TextEditingController ingredientSizeController = TextEditingController();

  void store(bahan, value) {
    ApiService.addIngredient(bahan, value.toString(), widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
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
                        controller: ingredientController,
                        cursorColor: orange,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Bahan harus diisi';
                          }
                          return null;
                        },
                        style: blackTextStyle,
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "Bahan",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
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
                        controller: ingredientSizeController,
                        cursorColor: orange,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Kosong';
                          }
                          return null;
                        },
                        style: blackTextStyle,
                        decoration: const InputDecoration(
                          hintStyle: subtitleTextStyle,
                          hintText: "Takaran",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSend
              ? Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child: Text("+"),
                    onPressed: () {
                      // _AddRecipeIngredientState tes = _AddRecipeIngredientState
                      //     as _AddRecipeIngredientState;
                      // tes.addIngredientForm;
                      store(ingredientController.text,
                          ingredientSizeController.text);
                      setState(() {
                        isSend = false;
                      });
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class _AddRecipeIngredientState extends State<AddRecipeIngredient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<IngredientForm> listIngredient = [];

  @override
  void initState() {
    super.initState();
    addIngredientForm();
  }

  addIngredientForm() {
    listIngredient.add(IngredientForm(
      recipeId: widget.recipeId,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: orange,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigation.intentWithData(
                AddRecipeStep.routeName, (widget.recipeId));
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
                    child: const Text('Tutup', style: orangeSmallTextStyle),
                  ),
                ],
              ),
            );
            return;
          }
        },
        child: const Icon(Icons.navigate_next_rounded, size: 36),
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
                          'Bahan Resep',
                          style: helloTextStyle,
                        ),
                        Text(
                          'Masukkan bahan resep di sini',
                          style: TextStyle(fontFamily: font, color: black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: listIngredient.length,
                      itemBuilder: (context, index) {
                        return listIngredient[index];
                      }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Text('+   Tambah Bahan',
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
                            addIngredientForm();
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
