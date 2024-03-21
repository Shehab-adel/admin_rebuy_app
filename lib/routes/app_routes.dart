import 'package:admin_rebuy_app/main_screen/add_product/add_prouct_screen.dart';
import 'package:admin_rebuy_app/main_screen/forget_password/forget_pasword_screen.dart';
import 'package:admin_rebuy_app/main_screen/login_screen/login_screen.dart';
import 'package:admin_rebuy_app/main_screen/main_screen.dart';
import 'package:admin_rebuy_app/main_screen/register_screen/register_screen.dart';
import 'package:admin_rebuy_app/verify_email/verify_email_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String mainScreen = '/main_screen';
  static const String addProduct = 'add_product';
  static const String register = 'register';
  static const String login = 'login';
  static const String forgetPassword = 'forgetPassword';
  static const String verifyEmail = 'verifyEmail';

  static Map<String, WidgetBuilder> routes = {
    mainScreen: (context) => const MainScreen(),
    addProduct: (context) => const AddProductScreen(),
    register: (context) => const RegisterScreen(),
    login: (context) => const LoginScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    verifyEmail: (context) => VerifyEmailScreen(),
  };
}
