import 'package:flutter/material.dart';

import '../../../laptop_page/view/screens/laptop_page.dart';
import '../../../cart_page/view/screens/cart_page.dart';
import '../../../favorite_page/view/screens/favorite_page.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<String> _titles = ['Laptops', 'My Cart', 'Favorites'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[currentIndex]),
        backgroundColor: Colors.indigo,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          LaptopPage(),
          CartPage(),
          FavoritePage(), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Laptops'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
