import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/bottomnav_controller.dart';
import 'package:plany/pages/mobileview/mobile_history_page.dart';
import 'package:plany/pages/mobileview/mobile_home_page.dart';
import 'package:plany/pages/mobileview/mobile_profile_page.dart';

class MobileInitialPage extends StatelessWidget {
  MobileInitialPage({super.key});

  final BottomnavController controller = Get.find<BottomnavController>();

  final List<Widget> pages = [MobileHomePage(), MobileHistoryPage(), MobileProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFF1F0E4),
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
