import 'package:admin_rebuy_app/core/app_strings.dart';
import 'package:admin_rebuy_app/core/functions.dart';
import 'package:admin_rebuy_app/core/image_constant.dart';
import 'package:admin_rebuy_app/routes/app_routes.dart';
import 'package:admin_rebuy_app/widgets/custom_elevated_button.dart';
import 'package:admin_rebuy_app/widgets/custom_page_header_widget.dart';
import 'package:admin_rebuy_app/widgets/custom_text_formfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.loginCubit});
  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.w, top: 10.h, right: 16.w),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is SuccessfulLogin) {
                Navigator.pushNamed(context, AppRoutes.mainScreen);
              } else if (state is FailLogin) {
                customshowDialog(
                    context, 'Error! try again', 'password is wrong');
              }
            },
            builder: (context, state) {
              return Column(children: [
                const CustomPageHeaderWidget(
                    text1: AppStrings.welcomeToEcom,
                    text2: AppStrings.signInToContinue),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: loginCubit.passwordController,
                  hintText: AppStrings.password,
                  imagePath: AppImageConstants.imgLock,
                  obscureText: true,
                  borderDecoration: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 5.w,
                  ),
                ),
                state is LoadingLogin
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.purple,
                      ))
                    : CustomElevatedButton(
                        text: AppStrings.signIn,
                        onPressed: () {
                          loginCubit.loginWithFirebase();
                        }),
                SizedBox(height: 18.h),
              ]);
            },
          ),
        ));
  }
}
