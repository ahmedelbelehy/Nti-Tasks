import 'package:api_task/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/product/presentation/widgets/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Jewelry Store',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 129, 27, 143),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              );
            } else if (state is ProductLoaded) {
              if (state.products.isEmpty) {
                return const Center(child: Text('No products found'));
              }
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                itemCount: state.products.length,
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemBuilder:
                    (context, index) =>
                        ProductItem(product: state.products[index]),
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
