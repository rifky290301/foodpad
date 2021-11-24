import 'package:flutter/material.dart';

//Font
const font = 'Poppins';

//Color
const white = Colors.white;
const orange = Color(0xFFFF4A32);
const lightGray = Color(0xFF9D9D9D);
const gray = Colors.black54;
const black = Color(0xFF323232);

//Text Style
const textStyle = TextStyle(fontFamily: font, color: Color(0xFF9D9D9D));

const titleTextStyle =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w700, fontSize: 24);

const orangeTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w700, fontSize: 20, color: orange);

const orangeSmallTextStyle =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w700, color: orange);

const subtitleTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w600, color: Color(0xFF9D9D9D));

//Button Style
var buttonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(white),
  backgroundColor: MaterialStateProperty.all<Color>(orange),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);
