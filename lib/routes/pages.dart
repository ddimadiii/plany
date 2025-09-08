import 'package:get/route_manager.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/initial_page.dart';
import 'package:plany/pages/login_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/pages/splash_screen.dart';

class Pages {
  static final pages = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/initial', page: () => InitialPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/history', page: () => HistoryPage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
  ];
}
