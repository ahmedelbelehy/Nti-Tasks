import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'product_grid.dart';

class ElectronicsGrid extends StatelessWidget {
  final List<Product> products;
  const ElectronicsGrid({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ProductGrid(products: products);
  }
}
