import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  var obscurePassword = true.obs;

  void auth() {
    String usernameToString = username.text.trim();
    String passwordToString = password.text.trim();

    if (usernameToString == "madi" && passwordToString == "keiko") {
      Get.snackbar(
        "Auth",
        "Login Berhasil",
        backgroundColor: const Color.fromARGB(200, 17, 148, 208),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
      Get.toNamed('/initial');
    } else {
      Get.snackbar(
        "Auth",
        "Login Gagal",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
    username.clear();
    password.clear();
  }
}
