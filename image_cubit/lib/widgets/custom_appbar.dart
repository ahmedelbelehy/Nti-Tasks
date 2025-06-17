import 'package:flutter/material.dart';
import '../cubit/background_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BackgroundState state;

  const CustomAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        state.appBarTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: state.appBarColor,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu, color: Colors.white, size: 30),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
