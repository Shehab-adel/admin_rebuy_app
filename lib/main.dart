import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/routes/app_routes.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const AdminRebuyApp());
}

class AdminRebuyApp extends StatelessWidget {
  const AdminRebuyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AddProductCubit(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Admin rebuy app',
            debugShowCheckedModeBanner: false,
            theme: ThemeApp.themeData(),
            initialRoute: AppRoutes.mainScreen,
            routes: AppRoutes.routes,
          );
        }));
  }
}
