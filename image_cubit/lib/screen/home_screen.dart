import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cubit/constant/data.dart';
import 'package:image_cubit/widgets/custom_appbar.dart';
import '../cubit/background_cubit.dart';
import '../cubit/counter_cubit.dart'; 
import '../widgets/custom_drawer.dart';
import '../widgets/background_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BackgroundCubit()),
        BlocProvider(create: (_) => CounterCubit()), 
      ],
      child: BlocBuilder<BackgroundCubit, BackgroundState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(state: state),
            drawer: CustomDrawer(),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    backgroundImages[state.currentIndex],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) =>
                        progress == null
                            ? child
                            : const Center(child: CircularProgressIndicator()),
                  ),
                ),
               
                Center(
                  child: BlocBuilder<CounterCubit, int>(
                    builder: (context, count) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$count',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<CounterCubit>().decrement(),
                                child: const Text('-'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<CounterCubit>().reset(),
                                child: const Text('Reset'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<CounterCubit>().increment(),
                                child: const Text('+'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BackgroundSelector(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
