import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'product_grid.dart';

class JeweleryGrid extends StatelessWidget {
  final List<Product> products;
  const JeweleryGrid({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ProductGrid(products: products);
  }
}
