import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';
import 'package:advice_app/feature/pokemon_screen/model/pokemon_model.dart';

class Move {
  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({required this.move, required this.versionGroupDetails});

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      move: Species.fromJson(json["move"]),
      versionGroupDetails: List<VersionGroupDetail>.from(
        json["version_group_details"].map(
          (x) => VersionGroupDetail.fromJson(x),
        ),
      ),
    );
  }
}
