import 'package:flutter/material.dart';

class LightThemeColor {
  static const primaryColor = Color.fromARGB(255,65,88, 254);
  static const secondaryColor = Color.fromARGB(255, 0, 31, 97);
  static const thirdColor = Color.fromARGB(255, 2, 71, 186);
  static const fourthColor = Color.fromARGB(255, 11, 142, 255);
  static const onPrimary = Colors.white;
  static const backgroundColor = Colors.white;
  static const surface = Colors.white;
  static const primaryTextColor = Color.fromARGB(255, 35, 35, 35);
  static const secondaryTextColor = Color.fromARGB(255, 85, 86, 88);
}

class DarkThemeColor {}


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}