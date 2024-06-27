import 'package:admin_rebuy_app/presentation/login/cubit/login_cubit.dart';
import 'package:admin_rebuy_app/presentation/login/login%20screen.dart';
import 'package:admin_rebuy_app/presentation/main_screen/add_product/add_prouct_screen.dart';
import 'package:admin_rebuy_app/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String mainScreen = 'main_screen';
  static const String addProduct = 'add_product';
  static const String loginScreen = '/login';

  static Map<String, WidgetBuilder> routes = {
    mainScreen: (context) => const MainScreen(),
    addProduct: (context) => const AddProductScreen(),
    loginScreen: (context) => LoginScreen(
          loginCubit: LoginCubit.get(context),
        )
  };
}
