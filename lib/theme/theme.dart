import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrogel/theme/colors.dart';
import 'package:hydrogel/theme/text.dart';

class AppTheme {

//Ligth theme  
  final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: LightThemeColor.primaryColor,
        secondary: LightThemeColor.secondaryColor,
        surface: LightThemeColor.surface,
        background: LightThemeColor.backgroundColor,
      ),

//Icon theme
      iconTheme:
          const IconThemeData(color: Color.fromARGB(255, 2, 71, 186), size: 25),

//Text theme
      textTheme: GoogleFonts.radioCanadaTextTheme().copyWith(
        displaySmall: AppTextTheme.displaySmall,
        bodyLarge: AppTextTheme.bodyLarge,
        titleLarge: AppTextTheme.titleLarge,
        titleMedium: AppTextTheme.titleMedium,
      ),
//App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: LightThemeColor.primaryColor,
      ),

//Defualt button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(LightThemeColor.primaryColor),
              minimumSize: const MaterialStatePropertyAll(Size(310, 55)),
              foregroundColor:
                  const MaterialStatePropertyAll(LightThemeColor.onPrimary),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))))));

  final ThemeData darkTheme = ThemeData();
}
