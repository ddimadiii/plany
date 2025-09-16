import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/task_controller.dart';
import 'package:plany/widgets/custom_item_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final todoCtrl = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F0E4),
        title: const Text(
          "YOUR PLANS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Obx(() {
        if (todoCtrl.activeTasks.isEmpty) {
          // kalau belum ada task
          return const Center(
            child: Text(
              "Belum ada task",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          );
        } else {
          // kalau ada task → tampilkan list
          return ListView.builder(
            itemCount: todoCtrl.activeTasks.length,
            itemBuilder: (context, index) {
              final todo = todoCtrl.activeTasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: CardItemTile(
                  leadingText: (index + 1).toString(),
                  title: todo.todo,
                  category: "Kategori : ${todo.kategori}",
                  description: todo.deskripsi,
                  cardColor: const Color(0xFFF1F0E4),
                  done: false,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.check_box_outline_blank,
                      color: Color.fromARGB(255, 134, 180, 151),
                    ),
                    onPressed: () => todoCtrl.completeTask(index),
                    tooltip: "Tandai Selesai",
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEDEDDD),
        onPressed: () => Get.toNamed('/addtodo'),
        child: const Icon(Icons.add, color: Colors.black87),
      ),
    );
  }
}
