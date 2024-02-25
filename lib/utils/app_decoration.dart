import 'package:flutter/material.dart';

class AppDecoration {
  // Outline decorations
  static BoxDecoration get outlineBlue => BoxDecoration(
        color: Colors.grey.withOpacity(1),
        border: Border.all(
          color: Colors.blue.shade50,
          width: 1,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        15,
      );
}
