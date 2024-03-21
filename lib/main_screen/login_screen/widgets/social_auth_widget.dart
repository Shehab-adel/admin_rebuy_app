import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/image_constant.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../cubit/login_cubit.dart';


class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomOutlinedButton(
        text: 'loginWithGoogle',
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: AppImageConstants.imgGoogleIcon,
                height: 24.h,
                width: 24.w)),
        onPressed: () {
          LoginCubit.get(context).signInWithGoogle();
        },
      ),
      SizedBox(height: 8.h),
      CustomOutlinedButton(
        text:'loginWithFacebook',
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: AppImageConstants.imgFacebookIcon,
                height: 24.h,
                width: 24.w)),
      )
    ]);
  }
}
