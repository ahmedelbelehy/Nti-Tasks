import 'package:api_store/features/screen/product_home_page.dart';
import 'package:flutter/material.dart';


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
