import 'package:flutter/material.dart';
import 'package:store/feature/laptop_page/model/laptop_model.dart';
import 'package:store/feature/product_details/view/widget/action_buttons.dart';
import 'package:store/feature/product_details/view/widget/details_chip.dart';
import 'package:store/feature/product_details/view/widget/laptop_description.dart';
import 'package:store/feature/product_details/view/widget/laptop_header.dart';
import 'package:store/feature/product_details/view/widget/laptop_image.dart';
import 'package:store/feature/product_details/view/widget/price_tag.dart';

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LaptopImage(imageUrl: laptop.image),
            const SizedBox(height: 24),
            LaptopHeader(name: laptop.name, brand: laptop.brand),
            const SizedBox(height: 16),
            PriceTag(price: laptop.price),
            const SizedBox(height: 30),

           
            Row(
              children: [
                DetailChip(label: 'Status', value: laptop.status),
                const SizedBox(width: 10),
                DetailChip(label: 'Category', value: laptop.category),
                const SizedBox(width: 10),
                DetailChip(
                  label: 'Stock',
                  value: laptop.countInStock?.toString() ?? '-',
                ),
              ],
            ),

            const SizedBox(height: 20),
            LaptopDescription(description: laptop.description),
            const SizedBox(height: 24),
            ActionButtons(laptop: laptop),
          ],
        ),
      ),
    );
  }
}
