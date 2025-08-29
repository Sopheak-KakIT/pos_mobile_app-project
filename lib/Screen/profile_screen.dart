import 'package:flutter/material.dart';
import 'package:pos/Helper/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylecolor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(
                  255,
                  119,
                  128,
                  135,
                ), // any predefined color
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                "SOPHEAK",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "JetBrains Mono",
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "sopheak123@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Implement Edit Profile
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Account Settings"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Implement Account Settings
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text("Order History"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Implement Order History
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
