import 'dart:math';
import 'package:advice_app/feature/pokemon_screen/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonServices {
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  final Dio _dio = Dio();

  Future<PokemonModel> getPokemonById(int id) async {
    try {
      final response = await _dio.get('$_baseUrl$id');
      return PokemonModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Error fetching Pokémon with ID $id: ${e.message}');
      throw Exception(
        'Failed to connect to the Pokédex. Please check your network.',
      );
    } catch (e) {
      print('An unexpected error occurred: $e');
      throw Exception('An unknown error occurred.');
    }
  }

  Future<PokemonModel> getPokemon() async {
    final randomId = Random().nextInt(898) + 1;
    return getPokemonById(randomId);
  }
}
