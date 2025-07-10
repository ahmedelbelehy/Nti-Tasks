import 'package:flutter/material.dart';

SnackBar showCustomSnackBar({required String text, required Color color}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating, // ✅ Floating to allow margin
    margin: const EdgeInsets.all(16), // ✅ Keeps it off screen edges
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    duration: const Duration(seconds: 3),
  );
}
