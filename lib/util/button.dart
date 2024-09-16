import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double width; // Add width parameter

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.width = 300.0, // Default width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Set the width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? const Color.fromARGB(255, 228, 59, 47)
              : Colors.grey, // Background color
          padding: const EdgeInsets.all(24), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Border radius
          ),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ).copyWith(
          foregroundColor: WidgetStateProperty.all<Color>(
            isEnabled ? Colors.white : Colors.black, // Text color
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(text),
      ),
    );
  }
}
