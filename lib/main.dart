import 'package:admin_rebuy_app/main_screen/main_screen.dart';
import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const AdminRebuyApp());
}

class AdminRebuyApp extends StatelessWidget {
  const AdminRebuyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Admin rebuy app',
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.themeData(),
        home: const MainScreen(),
      );
    });
  }
}
