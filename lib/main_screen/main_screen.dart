import 'package:admin_rebuy_app/main_screen/category/category_screen.dart';
import 'package:admin_rebuy_app/main_screen/flash_sale/flash_screen.dart';
import 'package:admin_rebuy_app/main_screen/mega_sale/mega_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    CategoryScreen(),
    FlashScreen(),
    MegaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Flash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Mega',
          ),
        ],
      ),
    );
  }
}
