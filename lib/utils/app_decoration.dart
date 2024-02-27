import 'package:flutter/material.dart';

class AppDecoration {
  // Outline decorations
  static BoxDecoration get outlineBlue => BoxDecoration(
      color: Colors.grey.withOpacity(1),
      border: Border.all(
        color: Colors.blue.shade50,
        width: 1,
      ),
      borderRadius: BorderRadiusStyle.roundedBorder5);

  static BoxDecoration get outlineWhite => BoxDecoration(
        color: CustomColor.whitecolor,
        borderRadius: BorderRadiusStyle.roundedBorder5,
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        15,
      );
}

class CustomColor {
  static Color get whitecolor => Colors.white;
  static Color get balckcolor => Colors.black;
  static Color get redcolor => Colors.red;
}
