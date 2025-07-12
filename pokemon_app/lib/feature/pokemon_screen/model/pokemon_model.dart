import 'package:advice_app/feature/pokemon_screen/model/parts_model/ability_element.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/cries.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/game_index.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/held_item.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/move.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/species.dart';

class PokemonModel {
  final List<AbilityElement> abilities;
  final int baseExperience;
  final Cries cries;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastAbilities;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<StatElement> stats;
  final List<TypeElement> types;
  final int weight;

  PokemonModel({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      abilities: List<AbilityElement>.from(
        json["abilities"].map((x) => AbilityElement.fromJson(x)),
      ),
      baseExperience: json["base_experience"],
      cries: Cries.fromJson(json["cries"]),
      forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
      gameIndices: List<GameIndex>.from(
        json["game_indices"].map((x) => GameIndex.fromJson(x)),
      ),
      height: json["height"],
      heldItems: List<HeldItem>.from(
        json["held_items"].map((x) => HeldItem.fromJson(x)),
      ),
      id: json["id"],
      isDefault: json["is_default"],
      locationAreaEncounters: json["location_area_encounters"],
      moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
      name: json["name"],
      order: json["order"],
      pastAbilities: List<dynamic>.from(json["past_abilities"].map((x) => x)),
      pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
      species: Species.fromJson(json["species"]),
      sprites: Sprites.fromJson(json["sprites"]),
      stats: List<StatElement>.from(
        json["stats"].map((x) => StatElement.fromJson(x)),
      ),
      types: List<TypeElement>.from(
        json["types"].map((x) => TypeElement.fromJson(x)),
      ),
      weight: json["weight"],
    );
  }
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      levelLearnedAt: json["level_learned_at"],
      moveLearnMethod: Species.fromJson(json["move_learn_method"]),
      versionGroup: Species.fromJson(json["version_group"]),
    );
  }
}

class Sprites {
  final String backDefault;
  final String? backFemale;
  final String backShiny;
  final String? backShinyFemale;
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;
  final OtherSprites other;
  final VersionSprites versions;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    required this.other,
    required this.versions,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
      other: OtherSprites.fromJson(json["other"]),
      versions: VersionSprites.fromJson(json["versions"]),
    );
  }
}

class OtherSprites {
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  OtherSprites({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory OtherSprites.fromJson(Map<String, dynamic> json) {
    return OtherSprites(
      dreamWorld: DreamWorld.fromJson(json["dream_world"]),
      home: Home.fromJson(json["home"]),
      officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
    );
  }
}

class DreamWorld {
  final String? frontDefault;
  final dynamic frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  factory DreamWorld.fromJson(Map<String, dynamic> json) {
    return DreamWorld(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
    );
  }
}

class Home {
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;

  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
    );
  }
}

class OfficialArtwork {
  final String? frontDefault;
  final String? frontShiny;

  OfficialArtwork({this.frontDefault, this.frontShiny});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }
}

class VersionSprites {
  final GenerationI generationI;
  final GenerationII generationII;

  VersionSprites({required this.generationI, required this.generationII});

  factory VersionSprites.fromJson(Map<String, dynamic> json) {
    return VersionSprites(
      generationI: GenerationI.fromJson(json["generation-i"]),
      generationII: GenerationII.fromJson(json["generation-ii"]),
    );
  }
}

class GenerationI {
  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI({required this.redBlue, required this.yellow});

  factory GenerationI.fromJson(Map<String, dynamic> json) {
    return GenerationI(
      redBlue: RedBlue.fromJson(json["red-blue"]),
      yellow: RedBlue.fromJson(json["yellow"]),
    );
  }
}

class RedBlue {
  final String? backDefault;
  final String? backGray;
  final String? frontDefault;
  final String? frontGray;

  RedBlue({this.backDefault, this.backGray, this.frontDefault, this.frontGray});

  factory RedBlue.fromJson(Map<String, dynamic> json) {
    return RedBlue(
      backDefault: json["back_default"],
      backGray: json["back_gray"],
      frontDefault: json["front_default"],
      frontGray: json["front_gray"],
    );
  }
}

class GenerationII {
  final Crystal crystal;
  final Gold gold;
  final Gold silver;

  GenerationII({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationII.fromJson(Map<String, dynamic> json) {
    return GenerationII(
      crystal: Crystal.fromJson(json["crystal"]),
      gold: Gold.fromJson(json["gold"]),
      silver: Gold.fromJson(json["silver"]),
    );
  }
}

class Crystal {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) {
    return Crystal(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }
}

class Gold {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;

  Gold({this.backDefault, this.backShiny, this.frontDefault, this.frontShiny});

  factory Gold.fromJson(Map<String, dynamic> json) {
    return Gold(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }
}

class StatElement {
  final int baseStat;
  final int effort;
  final Species stat;

  StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) {
    return StatElement(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: Species.fromJson(json["stat"]),
    );
  }
}

class TypeElement {
  final int slot;
  final Species type;

  TypeElement({required this.slot, required this.type});

  factory TypeElement.fromJson(Map<String, dynamic> json) {
    return TypeElement(
      slot: json["slot"],
      type: Species.fromJson(json["type"]),
    );
  }
}
