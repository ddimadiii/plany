import 'package:flutter/material.dart';
import 'add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list untuk menyimpan todo
  List<Map<String, String>> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBA588),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD1CFB9), // krem
        title: const Text(
          "YOUR PLANS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // List todo
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDDD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        todo["title"] ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todo["desc"] ?? ""),
                          const SizedBox(height: 4),
                          Text(
                            todo["priority"] ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3A3C2F),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating button add
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEDEDDD),
        child: const Icon(Icons.add, color: Colors.black87),
        onPressed: () async {
          final newTodo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTodoPage()),
          );

          if (newTodo != null) {
            setState(() {
              todos.add(newTodo);
            });
          }
        },
      ),

      // Bottom nav (design only)
    );
  }
}
