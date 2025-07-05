import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/cart_page/view/widget/component/alert_dialog.dart';
import 'package:store/feature/cart_page/view/widget/component/cart_list_item.dart';
import '../../cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getCartProducts();
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return const Center(child: Text('Your cart is empty.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return CartListItem(
                  item: item,
                  onDelete: () => context.read<CartCubit>().removeFromCart(
                  productId: item.id,
                  ),
                  onEdit: () {
                  showDialog(
                    context: context,
                    builder: (context) => ShowAlertDialog(item: item),
                  );
                  },
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
