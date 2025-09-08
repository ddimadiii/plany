import 'package:get/get.dart';
import 'package:plany/controllers/auth_controller.dart';
import 'package:plany/controllers/bottomnav_controller.dart';
import 'package:plany/controllers/task_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BottomnavController>(() => BottomnavController(), );
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
