import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/pages/mobileview/mobile_profile_page.dart';
import 'package:plany/pages/wideview/wide_profile_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ResponsifController responsifController =
      Get.find<ResponsifController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          responsifController.updateScreen(constraints);

          return Obx(
            () => responsifController.isMobile.value
                ? MobileProfilePage()
                : WideProfilePage(),
          );
        },
      ),
    );
  }
}
