import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/auth_controller.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/pages/mobileview/mobile_login_page.dart';
import 'package:plany/pages/wideview/wide_login_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final ResponsifController responsifController =
      Get.find<ResponsifController>();

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          responsifController.updateScreen(constraints);

          return Obx(
            () => responsifController.isMobile.value
                ? MobileLoginPage()
                : WideLoginPage(),
          );
        },
      ),
    );
  }
}
