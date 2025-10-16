import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/database_helper.dart';
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

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final active = await DBHelper().getTodos(completed: false);
    final completed = await DBHelper().getTodos(completed: true);
    activeTasks.assignAll(active);
    completedTasks.assignAll(completed);
  }

  // tambah todo
  Future<void> createTask() async {
    final title = inputTitle.text.trim();
    final desc = inputDesc.text.trim();
    final cat = selectedCategory.value;

    if (title.isNotEmpty && cat != null) {
      final todo = ModelTodo(title, desc, cat);
      await DBHelper().insertTodo(todo);
      await fetchTasks();
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
  Future<void> completeTask(int index) async {
    final item = activeTasks[index];
    item.status = true;
    await DBHelper().updateTodo(item);
    await fetchTasks();
    _showMessage("Task selesai 🎉", Colors.teal);
  }

  // hapus dari history
  Future<void> deleteHistory(int index) async {
    final item = completedTasks[index];
    await DBHelper().deleteTodo(item.id!);
    await fetchTasks();
    _showMessage("Riwayat task dihapus", Colors.orangeAccent);
  }

  // hapus dari todo aktif
  Future<void> deleteTask(int index) async {
    final item = activeTasks[index];
    await DBHelper().deleteTodo(item.id!);
    await fetchTasks();
    _showMessage("Task dihapus", Colors.orangeAccent);
  }

  // update task
  Future<void> updateTask(ModelTodo updated) async {
    await DBHelper().updateTodo(updated);
    await fetchTasks();
    _showMessage("Task berhasil diupdate", Colors.blueAccent);
  }

  // toggle status selesai/belum selesai
  Future<void> toggleTaskStatus(ModelTodo todo) async {
    todo.status = !todo.status;
    await DBHelper().updateTodo(todo);
    await fetchTasks();
    _showMessage(
      todo.status ? "Task selesai 🎉" : "Task dipindahkan ke aktif",
      todo.status ? Colors.teal : Colors.blueGrey,
    );
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
