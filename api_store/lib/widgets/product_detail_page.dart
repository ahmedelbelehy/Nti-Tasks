import 'package:flutter/material.dart';
import '../product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.blue[700],
        elevation: 2,
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text(product.category),
                  backgroundColor: Colors.blue[100],
                ),
                const SizedBox(width: 12),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
