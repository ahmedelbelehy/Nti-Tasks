import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/favorite_page/view/widget/favorite_item.dart';
import '../../cubit/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteCubit>().getFavorites();
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteLoaded) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text('No favorites yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final laptop = state.favorites[index];
              return FavoriteListItem(
                laptop: laptop,
                onDelete: () => context
                    .read<FavoriteCubit>()
                    .removeFromFavorites(laptop.id),
              );
            },
          );
        } else if (state is FavoriteError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
