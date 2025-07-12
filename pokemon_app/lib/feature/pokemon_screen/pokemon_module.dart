import 'package:advice_app/feature/pokemon_screen/view/screen/pokemon_screen.dart';
import 'package:advice_app/feature/pokemon_screen/view_model/pokemon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocProvider getPokemonBloc() {
  return BlocProvider<PokemonCubit>(
    create: (context) => PokemonCubit()..getPokemon(),
    child: const PokemonScreen(),
  );
}