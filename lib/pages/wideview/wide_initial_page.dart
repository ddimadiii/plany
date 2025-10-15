import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/controllers/bottomnav_controller.dart';

class WideInitialPage extends StatelessWidget {
  WideInitialPage({super.key});

  final BottomnavController controller = Get.find<BottomnavController>();

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];
  final titles = ["Your Plans", "History", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(titles[controller.selectedIndex.value]),
          backgroundColor: const Color(0xFFF1F0E4),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFFF1F0E4)),
                child: const Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  controller.changeTab(0);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: () {
                  controller.changeTab(1);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  controller.changeTab(2);
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
        body: pages[controller.selectedIndex.value],
      ),
    );
  }
}
