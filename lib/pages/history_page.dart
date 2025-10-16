import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/controllers/task_controller.dart';
import 'package:plany/pages/mobileview/mobile_history_page.dart';
import 'package:plany/pages/wideview/wide_history_page.dart';
import 'package:plany/widgets/custom_item_tile.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final controller = Get.find<ResponsifController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateScreen(constraints);

          return Obx(
            () => controller.isMobile.value
                ? MobileHistoryPage()
                : WideHistoryPage()
          );
        },
      ),
    );
  }
}
