import 'package:admin_rebuy_app/main_screen/add_product/add_prouct_screen.dart';
import 'package:admin_rebuy_app/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String mainScreen = '/main_screen';
  static const String addProduct = 'add_product';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.mainScreen: (context) => const MainScreen(),
    AppRoutes.addProduct: (context) => const AddProductScreen()
  };
}
