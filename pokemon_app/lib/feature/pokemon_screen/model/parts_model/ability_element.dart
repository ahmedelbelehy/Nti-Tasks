import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';

class AbilityElement {
  final Species ability;
  final bool isHidden;
  final int slot;

  AbilityElement({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityElement.fromJson(Map<String, dynamic> json) {
    return AbilityElement(
      ability: Species.fromJson(json["ability"]),
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }
}