import 'package:flutter/material.dart';
import '../product_model.dart';
import 'product_grid.dart';

class MensClothingGrid extends StatelessWidget {
  final List<Product> products;
  const MensClothingGrid({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductGrid(products: products);
  }
}
