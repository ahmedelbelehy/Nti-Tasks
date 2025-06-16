import 'package:flutter/material.dart';

abstract class ImageTextState {
  final String text;
  final String imagePath;
  final Color buttonColor;

  const ImageTextState({
    required this.text,
    required this.imagePath,
    required this.buttonColor,
  });
}

class InitialImageTextState extends ImageTextState {
  const InitialImageTextState()
    : super(
        text: " hello",
        imagePath:
            "https://www.shutterstock.com/image-vector/vector-illustration-cool-mysterious-angry-600nw-2299949697.jpg",
        buttonColor: const Color.fromARGB(255, 12, 93, 186),
      );
}

class UpdatedImageTextState extends ImageTextState {
  const UpdatedImageTextState({
    required String text,
    required String imagePath,
    required Color buttonColor,
  }) : super(text: text, imagePath: imagePath, buttonColor: buttonColor);
}
