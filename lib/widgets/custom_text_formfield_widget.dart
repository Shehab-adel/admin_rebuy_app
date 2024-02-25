import 'package:admin_rebuy_app/utils/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.alignment,
      this.width,
      this.controller,
      this.focusNode,
      this.autofocus = true,
      this.textStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.height,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = true,
      this.validator,
      this.imagePath});

  final Alignment? alignment;

  final double? width;
  final double? height;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus!,
          style: textStyle,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle,
        prefixIcon: prefix,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        contentPadding: contentPadding ??
            const EdgeInsets.only(top: 30, right: 30, bottom: 15, left: 30),
        fillColor: fillColor ?? CustomColor.whitecolor,
        filled: true,
        border: borderDecoration ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
      );
}
