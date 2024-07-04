import 'package:admin_rebuy_app/presentation/login/cubit/login_cubit.dart';
import 'package:admin_rebuy_app/presentation/main_screen/category/category_screen.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/cubit/home_cubit.dart';
import 'package:admin_rebuy_app/presentation/main_screen/home/home_screen.dart';
import 'package:admin_rebuy_app/presentation/settings/settingsscreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens(context).elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  List<Widget> _screens(BuildContext context) => [
        HomeScreen(
          homeCubit: HomeCubit.get(context),
        ),
        const CategoryScreen(),
        SettingsScreen(
          loginCubit: LoginCubit.get(context),
        )
      ];
}
