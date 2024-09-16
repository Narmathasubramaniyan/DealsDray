import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final bool obscureText; // Add the obscureText parameter

  const CustomTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.hintText,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.obscureText = false, // Initialize obscureText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '', // Hide the character counter
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLength: maxLength,
      obscureText: obscureText, // Apply obscureText here
    );
  }
}
