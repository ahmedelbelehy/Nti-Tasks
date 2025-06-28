import 'package:flutter/material.dart';
import 'package:store/modle1/laptop_model.dart';
import '../../service/favorite_api.dart';

class LaptopDetailPage extends StatelessWidget {
  final LaptopModel laptop;
  const LaptopDetailPage({super.key, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(laptop.name),
        backgroundColor: Colors.indigo,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    laptop.image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.laptop, size: 120, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                laptop.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              Text(
                laptop.brand,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.indigoAccent,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${laptop.price} EGP',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  _DetailChip(label: 'Status', value: laptop.status),
                  const SizedBox(width: 10),
                  _DetailChip(label: 'Category', value: laptop.category),
                  const SizedBox(width: 10),
                  _DetailChip(
                    label: 'Stock',
                    value: laptop.countInStock?.toString() ?? '-',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                laptop.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Colors.indigo, width: 2),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Colors.indigo, width: 2),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await FavoriteApi().addFavorite(
                        productId: laptop.id,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to favorites!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context, true);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to add favorite: \$e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Add to Favorites',
                    style: TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final String label;
  final String value;
  const _DetailChip({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value', style: const TextStyle(fontSize: 13)),
      backgroundColor: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
