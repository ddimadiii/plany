import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController txtController;
  final String label;
  final bool obscureText;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.label,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainCol = const Color.fromARGB(244, 23, 44, 63);
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: mainCol, width: 2),
        ),
      ),
    );
  }
}
