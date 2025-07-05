import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/cart_page/cubit/cart_cubit.dart';
import 'package:store/feature/laptop_page/model/laptop_model.dart';


// ignore: must_be_immutable
class ShowAlertDialog extends StatelessWidget {
   ShowAlertDialog({super.key, required this.item});
  final LaptopModel item;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Quantity'),
      content: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Quantity'),
        onChanged: (value) {
          quantity = int.tryParse(value) ?? 1;
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CartCubit>().updateFromCart(
              productId: item.id,
              quantity: quantity,
            );
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
