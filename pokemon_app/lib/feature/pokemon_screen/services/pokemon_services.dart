import 'package:advice_app/feature/pokemon_screen/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonServices {
  final String url = 'https://pokeapi.co/api/v2/pokemon/pikachu';

  final Dio dio = Dio();

  Future<PokemonModel> getPokemon() async {
    try {
      Response response = await dio.get(url);
      print(response.data);
      return PokemonModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
