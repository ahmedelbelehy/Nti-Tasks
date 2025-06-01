import 'package:flutter/material.dart';
import 'package:my_app/models/char.dart';
import 'package:my_app/models/color.dart';
import 'package:my_app/widgets/item_builder.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 32,
      itemBuilder: (BuildContext context, int index) {
        return itemBuilder(getChar(index), getColor(index));
      },
    );
  }
}
