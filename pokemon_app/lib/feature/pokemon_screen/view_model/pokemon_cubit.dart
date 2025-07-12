import 'package:advice_app/feature/pokemon_screen/services/pokemon_services.dart';
import 'package:advice_app/feature/pokemon_screen/view_model/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
  final PokemonServices pokemonServices = PokemonServices();

  Future<void> getPokemon() async {
    try {
      emit(PokemonLoading());
      final pokemon = await pokemonServices.getPokemon();
      emit(PokemonLoaded(pokemonModel: pokemon));
    } catch (e) {
      emit(PokemonError(message: e.toString()));
    }
  }

  Future<void> getPokemonById(int id) async {
    if (id < 1) return;
    try {
      emit(PokemonLoading());
      final pokemon = await pokemonServices.getPokemonById(id);
      emit(PokemonLoaded(pokemonModel: pokemon));
    } catch (e) {
      emit(PokemonError(message: e.toString()));
    }
  }

  void getNextPokemon(int currentId) {
    getPokemonById(currentId + 1);
  }

  void getPreviousPokemon(int currentId) {
    if (currentId > 1) {
      getPokemonById(currentId - 1);
    }
  }
}