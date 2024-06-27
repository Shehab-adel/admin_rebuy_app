import 'package:admin_rebuy_app/core/image_constant.dart';
import 'package:admin_rebuy_app/core/theme/theme_helper.dart';
import 'package:admin_rebuy_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_icon_button.dart';

class CustomPageHeaderWidget extends StatelessWidget {
  const CustomPageHeaderWidget(
      {required this.text1, required this.text2, super.key});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomIconButton(
          height: 15.h,
          width: 30.w,
          padding: const EdgeInsets.all(20),
          decoration: IconButtonStyleHelper.fillPrimary,
          child: CustomImageView(imagePath: AppImageConstants.imageClose)),
      SizedBox(height: 5.h),
      Text(text1, style: theme.textTheme.titleMedium),
      SizedBox(height: 1.h),
      Text(text2, style: theme.textTheme.bodySmall)
    ]);
  }
}
