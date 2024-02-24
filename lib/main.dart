import 'package:admin_rebuy_app/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AdminRebuyApp());
}

class AdminRebuyApp extends StatelessWidget {
  const AdminRebuyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin rebuy app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
