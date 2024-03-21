import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_strings.dart';
import '../../core/image_constant.dart';
import '../../core/theme/custom_text_style.dart';
import '../../core/theme/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../verify_email/verify_email_screen.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_page_header_widget.dart';
import '../../widgets/custom_text_formfield_widget.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
            key: registerCubit.formKey,
            child: Container(
                constraints: const BoxConstraints.expand(),
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                  if (state is SuccessfulRegisterProcess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        registerCubit.snackBar(registerCubit.message));
                  } else if (state is FailRegisterProcess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        registerCubit.snackBar(registerCubit.message));
                  }
                }, builder: (context, state) {
                  return Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomPageHeaderWidget(
                              text1: 'letsGetStarted',
                              text2: 'createAnNewAccount'),
                          CustomTextFormField(
                            controller: registerCubit.usernameController,
                            hintText: 'fullName',
                            imagePath: AppImageConstants.imgUser,
                            validator: (value) {
                              return registerCubit.isValidUsername(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: registerCubit.emailController,
                            hintText: 'yourEmail',
                            imagePath: AppImageConstants.imgMail,
                            validator: (value) {
                              return registerCubit.validateEmail(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: registerCubit.passwordController,
                            hintText: 'password',
                            imagePath: AppImageConstants.imgLock,
                            validator: (value) {
                              return registerCubit.validatePassword(value);
                            },
                          ),
                          CustomTextFormField(
                            controller: registerCubit.confirmPasswordController,
                            hintText: 'passwordAgain',
                            imagePath: AppImageConstants.imgLock,
                            validator: (value) {
                              return registerCubit.confirmPassword(value);
                            },
                          ),
                          state is LoadingRegisterProcess
                              ? const Center(child: CircularProgressIndicator())
                              : CustomElevatedButton(
                                  text: 'signUp',
                                  onPressed: () async {
                                    if (registerCubit.formKey.currentState!
                                            .validate() ==
                                        true) {
                                      registerCubit
                                          .registerWithFirebaseAuth(context);
                                    }
                                  }),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        VerifyEmailScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Go to Check Email',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: appTheme.blueA200,
                                    decoration: TextDecoration.underline),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'loginScreen', (route) => false);
                            },
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'haveanAccount',
                                      style: theme.textTheme.bodySmall),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                      text: 'signIn',
                                      style:
                                          CustomTextStyles.labelLargePrimary_1)
                                ]),
                                textAlign: TextAlign.left),
                          ),
                        ]),
                  );
                }))));
  }
}
