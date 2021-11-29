import 'package:flutter/material.dart';

//Font
const font = 'Poppins';

//Color
const white = Colors.white;
const orange = Color(0xFFFF4A32);
var orangeSecondary = Colors.orange.shade300;
const lightGray = Color(0xFFF0F0F0);
const gray = Color(0xFF9D9D9D);
const darkGray = Colors.black54;
const black = Color(0xFF323232);

//Text Style
const textStyle = TextStyle(fontFamily: font, color: Color(0xFF9D9D9D));

const smallTextStyle = TextStyle(fontFamily: font, fontSize: 12, color: black);

const blackTextStyle = TextStyle(fontFamily: font, fontSize: 14, color: black);

const titleTextStyle =
    TextStyle(fontFamily: font, fontWeight: FontWeight.w700, fontSize: 22);

const headingTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w700, fontSize: 18, color: black);

const helloTextStyle = TextStyle(
    fontFamily: 'Poppins Bold', fontWeight: FontWeight.w800, fontSize: 28);

const orangeTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w700, fontSize: 18, color: orange);

const orangeSmallTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w700, color: orange, fontSize: 14);

const subtitleTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w600, color: gray, fontSize: 14);

const smallSubtitleTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w600, color: gray, fontSize: 11);

const itemTitleTextStyle = TextStyle(
    fontFamily: font, fontWeight: FontWeight.w700, color: black, fontSize: 14);

const itemTextStyle = TextStyle(fontFamily: font, fontSize: 14);
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
