import 'package:flutter/material.dart';
import 'package:ui/ui/onboarding/auth.dart';
import 'package:ui/ui/screens/home.dart';

void main() {
  runApp(const FigmaUi());
}

class FigmaUi extends StatelessWidget {
  const FigmaUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: OnBoarding());
  }
}
