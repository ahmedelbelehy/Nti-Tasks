import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/laptop_cubit.dart';
import '../../../cubit/laptop_state.dart';
import 'laptop_detail_page.dart';

class LaptopPage extends StatelessWidget {
  final VoidCallback? onFavoriteAdded;
  const LaptopPage({super.key, this.onFavoriteAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laptops')),
      body: BlocBuilder<LaptopCubit, LaptopState>(
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
                                  const Icon(
                                    Icons.laptop,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
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
              },
            );
          } else if (state is LaptopError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
