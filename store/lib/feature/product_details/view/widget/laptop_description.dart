import 'package:flutter/material.dart';

class LaptopDescription extends StatelessWidget {
  final String description;
  const LaptopDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}