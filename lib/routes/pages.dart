import 'package:get/route_manager.dart';
import 'package:plany/pages/initial_page.dart';
import 'package:plany/pages/login_page.dart';
import 'package:plany/pages/splash_screen.dart';

class Pages {
  static final pages = [
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/initial', page: () => InitialPage()),
  ];
}
