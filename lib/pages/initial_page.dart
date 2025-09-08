import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/controllers/bottomnav_controller.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});

  final BottomnavController controller = Get.put(BottomnavController());

  final pages = [const HomePage(), const HistoryPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
