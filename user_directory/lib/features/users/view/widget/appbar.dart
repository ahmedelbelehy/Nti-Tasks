import 'package:flutter/material.dart';

class AppbarScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppbarScreen({super.key, required this.title, this.leading});

  final String title;
  final Widget? leading;
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue[900],
      elevation: 0,
      leading: leading
    );
  }
}
