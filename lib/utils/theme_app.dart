import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData themeData() => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.blueGrey);
}

class CustomTextStyle {
  static TextStyle get textStyle20 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
}
