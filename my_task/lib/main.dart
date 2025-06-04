import 'package:flutter/material.dart';
import 'package:my_task/screen/home_page.dart';
import 'package:my_task/screen/login.dart';
import 'package:my_task/screen/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}
