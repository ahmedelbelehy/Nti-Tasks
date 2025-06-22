import 'package:flutter/material.dart';
import 'views/product_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Store',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ProductHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
