import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/version_detail.dart';

class HeldItem {
  final Species item;
  final List<VersionDetail> versionDetails;

  HeldItem({required this.item, required this.versionDetails});

  factory HeldItem.fromJson(Map<String, dynamic> json) {
    return HeldItem(
      item: Species.fromJson(json["item"]),
      versionDetails: List<VersionDetail>.from(
        json["version_details"].map((x) => VersionDetail.fromJson(x)),
      ),
    );
  }
}
