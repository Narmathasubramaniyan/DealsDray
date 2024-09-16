import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.items,
    required this.isSelected,
    required this.onPressed,
    this.vertical = false,
  });

  final List<Widget> items;
  final List<bool> isSelected;
  final Function(int) onPressed;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(18)),
      selectedBorderColor: const Color.fromARGB(255, 228, 59, 47),
      selectedColor: Colors.white, // Text color when selected
      fillColor: const Color.fromARGB(
          255, 228, 59, 47), // Background color when selected
      color: Colors.black, // Text color when unselected
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 100.0,
      ),
      isSelected: isSelected,
      borderColor: Colors.grey, // Border color for unselected buttons
      children: items,
    );
  }
}
