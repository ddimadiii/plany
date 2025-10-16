import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/task_controller.dart';
import 'package:plany/widgets/custom_item_tile.dart';

class WideHistoryPage extends StatelessWidget {
  WideHistoryPage({super.key});

  final todoCtrl = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFF1F0E4),
      //   title: const Text(
      //     "Wide HISTORY",
      //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      //   centerTitle: false,
      //   elevation: 0,
      // ),
      body: Obx(() {
        if (todoCtrl.completedTasks.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada task selesai",
              style: TextStyle(color: Colors.black, fontSize: 16),
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
                cardColor: const Color(0xFFF1F0E4), // krem
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
