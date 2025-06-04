import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'Smartphone',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQonniNGE2DZLt7ykEtyJn5B2fzzv-Kz5kG_w&s',
      'description':
          'A powerful smartphone with 128GB storage and great camera.',
      'price': '15,000',
    },
    {
      'title': 'Laptop',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHLpGBIMT6_HCT6r5ycvOqTGL3-ZpFdxwIGg&s',
      'description': 'A fast laptop suitable for work and gaming.',
      'price': '30,000',
    },
    {
      'title': 'Headphones',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUHev07IU1vNS527rWOLJfCmB1E625r-VL0w&s',
      'description': 'Noise-cancelling wireless headphones.',
      'price': '600',
    },
    {
      'title': 'Smartwatch',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO3KMCbT7OMHU7GlQzahfBKtmLfVCWAu8zrQ&s',
      'description': 'Stylish smartwatch with health tracking features.',
      'price': '1,500',
    },
    {
      'title': 'hard ssd',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQVzEZmaqdPU2iowG8pHkurYvv6Xgum3WeA&s',
      'description': 'hard ssd 512 faster.',
      'price': '2,000',
    },
    {
      'title': 'Camera',
      'image': 'https://graphicdesigneye.com/images/Nikon-Z7-II.jpg',
      'description': 'nikon camera .',
      'price': '40,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Product',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['title'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product['image'] ?? '',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['description'] ?? '',
                      style: const TextStyle(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      '${product['price']} \Egp',
                      style: const TextStyle(
                        color: Color.fromARGB(250, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
