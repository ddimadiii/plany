import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:plany/controllers/responsif_controller.dart';
import 'package:plany/controllers/splashscreen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsifController>(() => ResponsifController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
