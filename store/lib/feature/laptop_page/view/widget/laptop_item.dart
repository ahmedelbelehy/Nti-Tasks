import 'package:flutter/material.dart';
import 'package:store/feature/product_details/view/screen/laptop_detail_page.dart';


class LaptopGridItem extends StatelessWidget {
  final dynamic laptop;
  final VoidCallback? onFavoriteAdded;

  const LaptopGridItem({
    super.key,
    required this.laptop,
    this.onFavoriteAdded,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LaptopDetailPage(laptop: laptop),
          ),
        );
        if (result == true && onFavoriteAdded != null) {
          onFavoriteAdded!();
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        shadowColor: Colors.indigo.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.indigo.shade50, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  laptop.image,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.laptop, size: 80, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                laptop.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text(
                laptop.brand,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${laptop.price} EGP',
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
