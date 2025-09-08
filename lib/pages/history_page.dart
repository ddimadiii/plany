import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dummy card todo
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD1CFB9), // krem
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                title: const Text(
                  "Setup GitHub",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Membuat repositori github untuk memulai project",
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
