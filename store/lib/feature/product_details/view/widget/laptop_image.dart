import 'package:flutter/material.dart';

class LaptopImage extends StatelessWidget {
  final String imageUrl;
  const LaptopImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(
          imageUrl,
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.laptop, size: 120, color: Colors.grey),
        ),
      ),
    );
  }
}
