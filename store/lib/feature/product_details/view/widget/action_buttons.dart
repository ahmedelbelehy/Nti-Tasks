import 'package:flutter/material.dart';
import 'package:store/feature/laptop_page/model/laptop_model.dart';
import '../../../favorite_page/services/favorite_api.dart';
import '../../../cart_page/services/cart_api.dart';

class ActionButtons extends StatelessWidget {
  final LaptopModel laptop;
  const ActionButtons({super.key, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 260,
            child: _buildButton(
              label: 'Add to Cart',
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                try {
                  await CartApi().addToCart(productId: laptop.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Added to cart'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                } catch (e) {
                  _showError(context, 'Failed to add to cart: $e');
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 260,
            child: _buildButton(
              label: 'Add to Favorites',
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                try {
                  await FavoriteApi().addFavorite(productId: laptop.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Added to favorites!'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                    Navigator.pop(context, true);
                  }
                } catch (e) {
                  _showError(context, 'Failed to add favorite: $e');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: color, width: 2),
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(fontSize: 18, color: color)),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
