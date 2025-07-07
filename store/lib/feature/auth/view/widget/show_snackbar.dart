import 'package:flutter/material.dart';

SnackBar showCustomSnackBar({required String text, required Color color}) {
  return SnackBar(
    content: Text(text, style: const TextStyle(color: Colors.white)),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    duration: const Duration(seconds: 3),
  );
}
