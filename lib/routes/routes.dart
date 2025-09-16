import 'package:get/get.dart';
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
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.initial, page: () => InitialPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => HistoryPage(),
      binding: TodoBinding(),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
  ];
}
