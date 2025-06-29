import 'package:flutter/material.dart';

class LaptopHeader extends StatelessWidget {
  final String name;
  final String brand;
  const LaptopHeader({super.key, required this.name, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        Text(
          brand,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.indigoAccent,
          ),
        ),
      ],
    );
  }
}

