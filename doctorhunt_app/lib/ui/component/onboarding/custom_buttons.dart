import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key, required this.onPressed});

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xFF00CBA2), Color(0xFF00D3B3)],
            ),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text("Get Started", style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text("Skip", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
