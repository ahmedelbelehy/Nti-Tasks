import 'package:flutter/material.dart';

class DetailChip extends StatelessWidget {
  final String label;
  final String value;

  const DetailChip({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value', style: const TextStyle(fontSize: 13)),
      backgroundColor: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

