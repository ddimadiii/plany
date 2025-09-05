import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double conHeight;
  final double conWidth;
  final Color backColor;
  final VoidCallback onPressed; // ✅ ganti jadi VoidCallback
  final TextStyle? labelStyle;

  const CustomButton({
    super.key,
    required this.label,
    required this.conHeight,
    required this.conWidth,
    required this.backColor,
    required this.onPressed,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: conWidth,
          height: conHeight,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: backColor,
            ),
            child: Text(label, style: labelStyle),
          ),
        ),
      ],
    );
  }
}
