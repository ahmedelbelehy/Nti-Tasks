import 'package:flutter/material.dart';
import '../product_model.dart';
import 'product_grid.dart';

class ElectronicsGrid extends StatelessWidget {
  final List<Product> products;
  const ElectronicsGrid({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductGrid(products: products);
  }
}
