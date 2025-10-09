import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/auth_controller.dart';
import 'package:plany/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F0E4),
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

          // Profile
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                ProfileCard(
                  name: "Jumadi",
                  absen: 18,
                  imagePath: "assets/images/logo.png",
                ),
                ProfileCard(
                  name: "Keiko Shafira Wiyana",
                  absen: 19,
                  imagePath: "assets/images/profilekeiko.jpg",
                ),
              ],
            ),
          ),

          // Logout
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Panggil method logout dari AuthController
                  Get.find<AuthController>().logout();
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final int absen;
  final String imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.absen,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDECDD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: const Color(0xFFD9D9D9),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text("$absen", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
