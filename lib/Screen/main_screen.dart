import 'package:flutter/material.dart';
import 'package:pos/Screen/home_screen.dart';
import 'package:pos/Screen/menu_screen.dart';
import 'package:pos/Screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(),
    MenuScreen(),
  ];

  // Titles for AppBar
  final List<String> _titles = const ["Home", "Profile", "Menu"];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with dynamic title based on selected tab
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: const Color.fromARGB(255, 231, 157, 9),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
        ],
      ),
      // Body shows the current selected screen
      body: _screens[_currentIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 231, 157, 9),
        unselectedItemColor: Colors.grey,
        elevation: 4,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
