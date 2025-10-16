import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:plany/controllers/auth_controller.dart';
import 'package:plany/controllers/bottomnav_controller.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/controllers/splashscreen_controller.dart';
import 'package:plany/controllers/task_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsifController>(() => ResponsifController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BottomnavController>(() => BottomnavController());
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
