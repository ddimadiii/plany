import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/routes/routes.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  var obscurePassword = true.obs;

  void auth() {
    String usernameToString = username.text.trim();
    String passwordToString = password.text.trim();

    if (usernameToString == "madi" && passwordToString == "123") {
      Get.snackbar(
        "Auth",
        "Login Berhasil",
        backgroundColor: Colors.green[200],
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
      Get.offAllNamed(AppRoutes.initial);
    } else {
      Get.snackbar(
        "Auth",
        "Login Gagal",
        backgroundColor: Colors.red,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
    username.clear();
    password.clear();
  }
}
