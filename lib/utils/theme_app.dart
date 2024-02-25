import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData themeData() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      );
}

class CustomTextStyle {
  static TextStyle get textStyle20 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get textStyle18 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
}
