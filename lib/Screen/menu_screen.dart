import 'package:flutter/material.dart';
import 'login_screen.dart'; // make sure you import your LoginScreen

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _logout() {
    // Navigate back to LoginScreen and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _logout,
          icon: const Icon(Icons.logout),
          label: const Text(
            'Logout',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), // text color
              fontSize: 18,
              fontFamily: 'Roboto', // font size
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 230, 225, 225),
            padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
