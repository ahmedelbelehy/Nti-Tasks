import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cubit/constant/data.dart';
import '../cubit/background_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDKRTggkG7KJNaSJkYxMReaUwgjqsmk7QwIQ&s',
            ),
          ),
          const SizedBox(height: 30),
          ...drawerItems.map((item) {
            final data = item as Map<String, dynamic>;
            return ListTile(
              title: Text(data['title']),
              onTap: () {
                context.read<BackgroundCubit>().changeAppBar(
                  data['title'],
                  data['color'],
                );
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }
}
