import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';

class VersionDetail {
  final int rarity;
  final Species version;

  VersionDetail({required this.rarity, required this.version});

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      rarity: json["rarity"],
      version: Species.fromJson(json["version"]),
    );
  }
}