import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';

class GameIndex {
  final int gameIndex;
  final Species version;

  GameIndex({required this.gameIndex, required this.version});

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json["game_index"],
      version: Species.fromJson(json["version"]),
    );
  }
}