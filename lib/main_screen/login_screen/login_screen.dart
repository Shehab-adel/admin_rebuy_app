import 'package:admin_rebuy_app/main_screen/login_screen/widgets/build_or_line_widget.dart';
import 'package:admin_rebuy_app/main_screen/login_screen/widgets/social_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_strings.dart';
import '../../core/image_constant.dart';
import '../../core/theme/custom_text_style.dart';
import '../../core/theme/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_page_header_widget.dart';
import '../../widgets/custom_text_formfield_widget.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 16.w, top: 68.h, right: 16.w),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is SuccessfulLoginProcess) {
                  // Navigator.pushReplacementNamed(
                  //     context, AppRoutes.dashboardContainerScreen);
                  // loginCubit.loginshowDialog(
                  //     context, 'Sign in successful!', loginCubit.bodyMessage);
                }
                if (state is FailLoginProcess) {
                  loginCubit.loginshowDialog(
                      context, 'Sign in fail!', loginCubit.bodyMessage);
                }
                if (state is SuccessfulGoogleLoginProcess) {
                  // Navigator.pushReplacementNamed(
                  //     context, AppRoutes.dashboardContainerScreen);
                  // loginCubit.loginshowDialog(
                  //     context, 'Sign in successful!', loginCubit.bodyMessage);
                }
                if (state is FailGoogleLoginProcess) {
                  loginCubit.loginshowDialog(
                      context, 'Sign in fail!', loginCubit.bodyMessage);
                }
              },
              builder: (context, state) {
                return Column(children: [
                  const CustomPageHeaderWidget(
                      text1: 'welcomeToEcom', text2: 'signInToContinue'),
                  SizedBox(height: 28.h),
                  CustomTextFormField(
                    controller: loginCubit.emailController,
                    hintText: 'yourEmail',
                    imagePath: AppImageConstants.imgMail,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    controller: loginCubit.passwordController,
                    hintText: 'password',
                    imagePath: AppImageConstants.imgLock,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.h),
                  CustomElevatedButton(
                      text: 'signIn',
                      onPressed: () {
                        loginCubit.loginWithFirebaseAuth(context);
                      }),
                  SizedBox(height: 18.h),
                  const OrLineWidget(),
                  SizedBox(height: 16.h),
                  SocialAuthWidget(),
                  SizedBox(height: 17.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'forgetScreen');
                    },
                    child: Text('forgotPassword',
                        style: CustomTextStyles.labelLargePrimary),
                  ),
                  SizedBox(height: 7.h),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'registerScreen', (route) => false);
                      },
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'dontHaveAnAccount',
                                style: theme.textTheme.bodySmall),
                            const TextSpan(text: " "),
                            TextSpan(
                                text: 'signUp',
                                style: CustomTextStyles.labelLargePrimary_1)
                          ]),
                          textAlign: TextAlign.left)),
                ]);
              },
            )));
  }
}
