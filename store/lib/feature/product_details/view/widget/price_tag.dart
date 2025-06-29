import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final dynamic price;
  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '£$price EGP',
            style: const TextStyle(
              fontSize: 22,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
