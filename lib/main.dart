import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/routes/pages.dart';
import 'package:hydrogel/routes/routes.dart';

import 'package:hydrogel/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      theme: AppTheme().lightTheme,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
