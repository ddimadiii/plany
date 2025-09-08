import 'package:flutter/material.dart';

// CustomTextfield
class CustomTextfield extends StatelessWidget {
  final TextEditingController txtController;
  final String hinttext;
  final bool obscureText;
  final IconData icon;
  final floatingLabelBehavior;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.hinttext,
    required this.obscureText,
    required this.icon, this.floatingLabelBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEDEDDD),
        hintText: hinttext,
        prefixIcon: Icon(icon, color: Colors.black87),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// class CustomTextfield extends StatelessWidget {
//   final TextEditingController txtController;
//   final String label;
//   final bool obscureText;

//   const CustomTextfield({
//     super.key,
//     required this.txtController,
//     required this.label,
//     required this.obscureText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final Color mainCol = const Color.fromARGB(244, 23, 44, 63);
//     return TextField(
//       controller: txtController,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.black),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: mainCol, width: 2),
//         ),
//       ),
//     );
//   }
// }
