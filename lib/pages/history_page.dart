import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/task_controller.dart';
import 'package:plany/widgets/custom_item_tile.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final todoCtrl = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8A489), // coklat muda
      appBar: AppBar(
        backgroundColor: const Color(0xFFD1CFB9), // krem
        title: const Text(
          "HISTORY",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Obx(() {
        if (todoCtrl.completedTasks.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada task selesai",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: todoCtrl.completedTasks.length,
          itemBuilder: (context, index) {
            final doneTodo = todoCtrl.completedTasks[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: CardItemTile(
                leadingText: (index + 1).toString(),
                title: doneTodo.todo,
                category: "Kategori : ${doneTodo.kategori}",
                description: doneTodo.deskripsi,
                cardColor: const Color(0xFFD1CFB9), // krem
                done: true, // kasih status selesai
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => todoCtrl.deleteHistory(index),
                  tooltip: "Hapus dari History",
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
