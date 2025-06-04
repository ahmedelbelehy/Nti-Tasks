import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 25,
      selectedFontSize: 15,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Call"),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Communities"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
    );
  }
}
