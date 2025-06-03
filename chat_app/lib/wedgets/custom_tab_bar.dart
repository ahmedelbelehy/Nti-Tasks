import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
      ),

      child: const Center(child: SizedBox.shrink()),
    );
  }
}
