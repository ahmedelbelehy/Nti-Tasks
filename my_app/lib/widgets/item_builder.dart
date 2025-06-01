import 'package:flutter/material.dart';

Widget itemBuilder(String text, Color colorIndex) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: colorIndex,
    ),

    child: Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
