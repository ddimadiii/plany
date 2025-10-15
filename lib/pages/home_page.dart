import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/task_controller.dart';
import 'package:plany/widgets/custom_item_tile.dart';
import 'package:plany/routes/routes.dart';
import 'package:plany/models/model_todo.dart';

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
                color: Colors.white,
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
                  category: todo.kategori,
                  description: todo.deskripsi,
                  done: todo.status,
                  cardColor: const Color(0xFFF1F0E4),
                  onCheck: () => todoCtrl.completeTask(index),
                  onLongPress: () =>
                      _showTaskOptionsDialog(context, todo, index),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blueGrey),
                    onPressed: () => _showEditDialog(context, todo, index),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEDEDDD),
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add, color: Colors.black87),
      ),
    );
  }

  void _showEditDialog(BuildContext context, ModelTodo todo, int index) {
    final titleCtrl = TextEditingController(text: todo.todo);
    final descCtrl = TextEditingController(text: todo.deskripsi);
    final catCtrl = TextEditingController(text: todo.kategori);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Judul'),
              ),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              TextField(
                controller: catCtrl,
                decoration: const InputDecoration(labelText: 'Kategori'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newTitle = titleCtrl.text.trim();
                final newDesc = descCtrl.text.trim();
                final newCat = catCtrl.text.trim();
                if (newTitle.isNotEmpty && newCat.isNotEmpty) {
                  final updated = ModelTodo(
                    newTitle,
                    newDesc,
                    newCat,
                    status: todo.status,
                    id: todo.id,
                  );
                  await Get.find<TaskController>().updateTask(updated);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showStatusDialog(BuildContext context, ModelTodo todo) {
    final isDone = todo.status;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isDone ? 'Tandai sebagai belum selesai?' : 'Tandai sebagai selesai?',
        ),
        content: Text(
          isDone
              ? 'Task ini akan dipindahkan ke daftar aktif.'
              : 'Task ini akan dipindahkan ke riwayat selesai.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              await Get.find<TaskController>().toggleTaskStatus(todo);
              Navigator.of(context).pop();
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  void _showTaskOptionsDialog(BuildContext context, ModelTodo todo, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  todo.status ? Icons.undo : Icons.check_circle_outline,
                ),
                title: Text(
                  todo.status
                      ? 'Tandai sebagai belum selesai'
                      : 'Tandai sebagai selesai',
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _showStatusDialog(context, todo);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Hapus', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                  _showDeleteDialog(context, todo, index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, ModelTodo todo, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Task?'),
        content: const Text('Apakah kamu yakin ingin menghapus task ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (todo.status) {
                await Get.find<TaskController>().deleteHistory(index);
              } else {
                await Get.find<TaskController>().deleteTask(index);
              }
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
