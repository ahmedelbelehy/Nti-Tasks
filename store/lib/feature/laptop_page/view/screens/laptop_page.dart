import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/laptop_page/view/widget/laptop_item.dart';
import '../../cubit/laptop_cubit.dart';
import '../../cubit/laptop_state.dart';


class LaptopPage extends StatelessWidget {
  final VoidCallback? onFavoriteAdded;
  const LaptopPage({super.key, this.onFavoriteAdded});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaptopCubit, LaptopState>(
      builder: (context, state) {
        if (state is LaptopLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LaptopLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: state.laptops.length,
            itemBuilder: (context, index) {
              final laptop = state.laptops[index];
              return LaptopGridItem(
                laptop: laptop,
                onFavoriteAdded: onFavoriteAdded,
              );
            },
          );
        } else if (state is LaptopError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
