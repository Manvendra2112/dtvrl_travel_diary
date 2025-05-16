import 'package:flutter/material.dart';


class FTextStyle {
  static TextStyle custom({
    String fontFamily = 'Poppins',
    double fontSize = 16,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }
  static TextStyle customPreahvihear({
    String fontFamily = 'Preahvihear-Regular',
    double fontSize = 16,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}