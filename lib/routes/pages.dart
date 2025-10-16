import 'package:get/route_manager.dart';
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
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginPage(), binding: TodoBinding()),
    GetPage(
      name: '/initial',
      page: () => InitialPage(),
      binding: TodoBinding(),
    ),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/history', page: () => HistoryPage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/addtodo', page: () => AddTodoPage()),
  ];
}
