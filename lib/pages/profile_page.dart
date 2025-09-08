import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8A489),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD1CFB9), // krem
        title: const Text(
          "PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // List Profile
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                ProfileCard(name: "Jumadi", age: 18),
                ProfileCard(name: "Keiko Shafira Wiyana", age: 19),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final int age;

  const ProfileCard({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDECDD), // putih krem
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFD9D9D9), // abu muda
            child: Icon(Icons.person, size: 50, color: Color(0xFF3B3B2F)),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text("$age", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
