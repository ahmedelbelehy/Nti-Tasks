import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const Appbar(), body: const Body());
  }
}
