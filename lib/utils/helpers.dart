import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helpers{
  static void changeStatusBarColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: brightness
    ));
  }
}