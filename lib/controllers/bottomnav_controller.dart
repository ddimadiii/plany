import 'package:get/get.dart';

class BottomnavController extends GetxController {
  // index aktif → harus RxInt
  var selectedIndex = 0.obs;

  // ganti tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
