import 'package:admin_rebuy_app/main_screen/add_product/cubit/add_product_cubit.dart';
import 'package:admin_rebuy_app/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/routes/app_routes.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AdminRebuyApp());
}

class AdminRebuyApp extends StatelessWidget {
  const AdminRebuyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddProductCubit>(
            create: (BuildContext context) => AddProductCubit(),
          ),
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit(),
          ),
        ],
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
