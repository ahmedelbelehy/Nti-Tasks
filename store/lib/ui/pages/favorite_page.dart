import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/favorite_cubit.dart';
import '../../service/favorite_api.dart';
import '../../ui/pages/laptop_detail_page.dart';

class FavoritePage extends StatelessWidget {
  final String nationalId;
  const FavoritePage({super.key, required this.nationalId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoriteApi())..getFavorites(nationalId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: Colors.indigo,
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
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
                    onDelete: () {
                      context.read<FavoriteCubit>().removeFromFavorites(
                        laptop.id,
                      );
                    },
                  );
                },
              );
            } else if (state is FavoriteError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class FavoriteListItem extends StatelessWidget {
  final dynamic laptop;
  final VoidCallback? onDelete;
  const FavoriteListItem({Key? key, required this.laptop, this.onDelete})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [Colors.indigo.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            laptop.image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.laptop, size: 40, color: Colors.grey),
          ),
        ),
        title: Text(
          laptop.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.indigo,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              laptop.brand,
              style: const TextStyle(color: Colors.indigoAccent, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.attach_money, color: Colors.green, size: 18),
                Text(
                  '${laptop.price} EGP',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent, size: 26),
          onPressed: onDelete,
          tooltip: 'Delete from favorites',
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LaptopDetailPage(laptop: laptop)),
          );
        },
      ),
    );
  }
}
