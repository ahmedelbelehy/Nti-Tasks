import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TextContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33,
        width: (text.length > 3) ? 80 : 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          border: Border.all(color: Colors.grey[700]!, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontSize: (text.length > 1) ? 15 : 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}