import 'package:flutter/material.dart';
import '../service/product_service.dart';
import '../product_model.dart';
import '../views/electronics_grid.dart';
import '../views/jewelery_grid.dart';
import '../views/mens_clothing_grid.dart';
import '../views/womens_clothing_grid.dart';

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  Future<Map<String, List<Product>>> fetchAllProducts() async {
    final service = ProductService();
    final electronics = await service.fetchProducts(
      'https://fakestoreapi.com/products/category/electronics',
    );
    final jewelery = await service.fetchProducts(
      'https://fakestoreapi.com/products/category/jewelery',
    );
    final mensClothing = await service.fetchProducts(
      "https://fakestoreapi.com/products/category/men's%20clothing",
    );
    final womensClothing = await service.fetchProducts(
      "https://fakestoreapi.com/products/category/women's%20clothing",
    );
    return {
      'electronics': electronics,
      'jewelery': jewelery,
      'mensClothing': mensClothing,
      'womensClothing': womensClothing,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('products store'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        elevation: 2,
      ),
      body: Container(
        color: Colors.blue[50],
        child: SafeArea(
          child: FutureBuilder<Map<String, List<Product>>>(
            future: fetchAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black54,
                          tabs: [
                            Tab(text: 'Electronics'),
                            Tab(text: 'Jewelery'),
                            Tab(text: "Men's Clothing"),
                            Tab(text: "Women's Clothing"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ElectronicsGrid(products: data['electronics']!),
                            JeweleryGrid(products: data['jewelery']!),
                            MensClothingGrid(products: data['mensClothing']!),
                            WomensClothingGrid(products: data['womensClothing']!),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
