import 'package:flutter/material.dart';
import 'package:plany/widgets/custom_textfield.dart'; // pastikan path benar

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCategory; // kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDA789), // coklat background
      appBar: AppBar(
        title: const Text(
          "Add To Do",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFD9D6C1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextfield(
              txtController: titleController,
              label: "Title",
              obscureText: false,
              icon: Icons.text_fields,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              txtController: descriptionController,
              label: "Description",
              obscureText: false,

              icon: Icons.text_fields,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: "Category",
                labelStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white, // ✅ background putih
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(244, 23, 44, 63),
                  ),
                ),
              ),
              items: ["Urgent", "Normal", "Low"]
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // nanti logic simpan todo disini
                print("Title: ${titleController.text}");
                print("Desc: ${descriptionController.text}");
                print("Category: $selectedCategory");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 23, 44, 63),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Add To Do"),
            ),
          ],
        ),
      ),
    );
  }
}
