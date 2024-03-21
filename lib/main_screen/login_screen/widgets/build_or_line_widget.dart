import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/custom_text_style.dart';


class OrLineWidget extends StatelessWidget {
  const OrLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 9.h),
          child: SizedBox(width: 134.h, child: const Divider())),
      Text('Or', style: CustomTextStyles.titleSmallBluegray300_1),
      Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 9.h),
          child: SizedBox(width: 137.h, child: const Divider()))
    ]);
  }
}
