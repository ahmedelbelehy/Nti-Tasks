import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({
    super.key,
    required this.icon,
    required this.operation,
    required this.onPressed,
  });

  final IconData icon;
  final String operation;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: onPressed,
      ),
    );
  }
}
