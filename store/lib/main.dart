import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/ui/pages/favorite_page.dart';
import 'package:store/ui/pages/laptop_page.dart';

import 'cubit/laptop_cubit.dart';
import 'service/laptop_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptops Store',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeSwitcher(),
    );
  }
}

class HomeSwitcher extends StatefulWidget {
  const HomeSwitcher({super.key});
  @override
  State<HomeSwitcher> createState() => _HomeSwitcherState();
}

class _HomeSwitcherState extends State<HomeSwitcher> {
  int _selectedIndex = 0;
  static const String nationalId = '01009876567876';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          BlocProvider(
            create: (_) => LaptopCubit(LaptopApi())..getLaptops(),
            child: LaptopPage(
              onFavoriteAdded: () {
                setState(() {}); 
              },
            ),
          ),
          FavoritePage(nationalId: nationalId, key: ValueKey(_selectedIndex)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Laptops'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
