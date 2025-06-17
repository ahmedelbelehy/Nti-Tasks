import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cubit/constant/data.dart';
import '../cubit/background_cubit.dart';
class BackgroundSelector extends StatelessWidget {
  const BackgroundSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BackgroundCubit>().state;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          backgroundImages.length,
          (index) => GestureDetector(
            onTap: () => context.read<BackgroundCubit>().changeBackground(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: state.currentIndex == index
                      ? Colors.white
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(backgroundImages[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
