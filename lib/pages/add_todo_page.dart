import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/widgets/custom_textfield.dart';
import 'package:plany/controllers/task_controller.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final taskController = Get.find<TaskController>();
  String? selectedCategory;

  static const List<String> categories = ['Urgent', 'Normal', 'Low'];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      appBar: AppBar(
        title: const Text(
          "Add To Do",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF1F0E4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header
                        Row(
                          children: [
                            Icon(
                              Icons.playlist_add_check_rounded,
                              color: cs.primary,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Tambah Todo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(),

                        // Title
                        const SizedBox(height: 12),
                        CustomTextfield(
                          txtController: taskController.inputTitle,
                          hinttext: "Title",
                          obscureText: false,
                          icon: Icons.text_fields,
                        ),

                        // Description
                        const SizedBox(height: 12),
                        CustomTextfield(
                          txtController: taskController.inputDesc,
                          hinttext: "Description",
                          obscureText: false,
                          icon: Icons.notes,
                        ),

                        // Category
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: InputDecoration(
                            labelText: "Category",
                            labelStyle: const TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFFBBA588),
                              ),
                            ),
                          ),
                          items: categories
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                              taskController.selectedCategory.value = value;
                            });
                          },
                        ),

                        // Button
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              taskController.createTask();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBBA588),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text("Add To Do"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
