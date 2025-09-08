import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/controllers/bottomnav_controller.dart';

class InitialPage extends StatelessWidget {
  InitialPage({super.key});

  final BottomnavController controller = Get.find<BottomnavController>();

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFEDEDDD),
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: const Color.fromARGB(244, 23, 44, 63),
          unselectedItemColor: Colors.grey[600],
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
