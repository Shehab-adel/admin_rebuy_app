import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.margin,
    required this.onPressed,
    this.style,
    this.height,
    this.width,
    this.textStyle,
    required this.text,
    TextStyle? buttonStyle,
  });

  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(20),
      decoration: decoration,
      child: ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: Text(text, style: textStyle)),
    );
  }
}
