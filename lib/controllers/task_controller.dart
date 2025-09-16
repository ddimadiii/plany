import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/models/model_todo.dart';
import 'package:plany/routes/routes.dart';
class TaskController extends GetxController {
  // textfield controller
  final inputTitle = TextEditingController();
  final inputDesc = TextEditingController();
  final selectedCategory = RxnString();

  // data todo & history
  var activeTasks = <ModelTodo>[].obs;
  var completedTasks = <ModelTodo>[].obs;

  // tambah todo
  void createTask() {
    final title = inputTitle.text.trim();
    final desc = inputDesc.text.trim();
    final cat = selectedCategory.value;

    if (title.isNotEmpty && cat != null) {
      activeTasks.add(ModelTodo(title, desc, cat));
      _showMessage("Task berhasil dibuat", Colors.green.shade700);

      // reset field
      inputTitle.clear();
      inputDesc.clear();
      selectedCategory.value = null;

      Get.offNamed(AppRoutes.initial);
    } else {
      _showMessage("Task gagal ditambahkan", Colors.redAccent);
    }
  }

  // tandai selesai
  void completeTask(int index) {
    final item = activeTasks[index];
    item.status = true;
    activeTasks.removeAt(index);
    completedTasks.add(item);
    _showMessage("Task selesai 🎉", Colors.teal);
  }

  // hapus dari history
  void deleteHistory(int index) {
    completedTasks.removeAt(index);
    _showMessage("Riwayat task dihapus", Colors.orangeAccent);
  }

  // hapus dari todo aktif
  void deleteTask(int index) {
    activeTasks.removeAt(index);
    _showMessage("Task dihapus", Colors.orangeAccent);
  }

  // util snackbar
  void _showMessage(String msg, Color color) {
    Get.snackbar(
      "Info",
      msg,
      backgroundColor: color,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }
}
