import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/routes/routes.dart';

class WideSplashScreen extends StatefulWidget {
  const WideSplashScreen({super.key});

  @override
  State<WideSplashScreen> createState() => _WideSplashScreenState();
}

class _WideSplashScreenState extends State<WideSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 120),
            const SizedBox(height: 16),
            const Text(
              "Wide PLANY",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
