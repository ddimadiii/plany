import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/mobileview/mobile_initial_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/controllers/bottomnav_controller.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/pages/wideview/wide_initial_page.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});
  final BottomnavController controller = Get.find<BottomnavController>();
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
                ? MobileInitialPage()
                : WideInitialPage(),
          );
        },
      ),
    );
  }
}
