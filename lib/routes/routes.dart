import 'package:get/get.dart';
import 'package:plany/bindings/bindings.dart';
import 'package:plany/bindings/splash_binding.dart';
import '../bindings/todo_binding.dart';
import '../pages/add_todo_page.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/initial_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const initial = '/initial';
  static const login = '/login';
  static const home = '/home';
  static const addTodo = '/addtodo';
  static const history = '/history';
  static const profile = '/profile';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => InitialPage(),
      binding: Binding(), // tambahkan ini
    ),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: Binding()),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: Binding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => HistoryPage(),
      binding: Binding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: Binding(),
    ),
  ];
}
