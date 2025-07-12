import 'package:advice_app/feature/pokemon_screen/view/screen/pokemon_screen.dart';
import 'package:flutter/material.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device App',
      home: PokemonScreen(),
    );
  }
}
