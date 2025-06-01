import 'package:flutter/material.dart';
import 'package:my_app/screens/home_page.dart';

class Alphabets extends StatelessWidget {
  const Alphabets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home :HomePage(),
    );
  }

}