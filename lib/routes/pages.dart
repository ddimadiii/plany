import 'package:get/route_manager.dart';
import 'package:plany/bindings/responsif_binding.dart';
import 'package:plany/bindings/splash_binding.dart';
import 'package:plany/bindings/todo_binding.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/initial_page.dart';
import 'package:plany/pages/login_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/pages/splash_screen.dart';
import 'package:plany/pages/add_todo_page.dart';

class Pages {
  static final pages = [
    GetPage(name: '/', page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: '/login', page: () => LoginPage(), binding: TodoBinding()),
    GetPage(
      name: '/initial',
      page: () => InitialPage(),
      bindings: [ResponsifBinding(), TodoBinding()],
    ),
    GetPage(name: '/home', page: () => HomePage(), binding: ResponsifBinding()),
    GetPage(
      name: '/history',
      page: () => HistoryPage(),
      binding: ResponsifBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
      binding: ResponsifBinding(),
    ),
    GetPage(
      name: '/addtodo',
      page: () => AddTodoPage(),
      binding: ResponsifBinding(),
    ),
  ];
}
