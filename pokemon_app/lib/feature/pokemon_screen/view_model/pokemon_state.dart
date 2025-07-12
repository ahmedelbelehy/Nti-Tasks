import 'package:advice_app/feature/pokemon_screen/model/pokemon_model.dart';

sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonLoaded extends PokemonState {
  final PokemonModel pokemonModel;

  PokemonLoaded({required this.pokemonModel});
}

final class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});
}

final class PokemonLoading extends PokemonState {}
