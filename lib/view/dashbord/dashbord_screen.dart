import 'package:flutter/material.dart';
import 'package:test_app/constants/bottom_nav.dart';
import 'package:test_app/view/dashbord/home/home_screen.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [HomeScreen(),
  HomeScreen(),HomeScreen(),HomeScreen(),HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNav(currentIndex: _selectedIndex, onTap: onTap),
      body: _screens[_selectedIndex]

    ));
  }

  onTap(int p1) {
    setState(() {
      _selectedIndex = p1;
    });
  }
}
