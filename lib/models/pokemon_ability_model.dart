class PokemonAbilities {
  List<PokemonAbility> abilities;

  PokemonAbilities({required this.abilities});

  factory PokemonAbilities.fromMap(Map<String, dynamic> json) => PokemonAbilities(
        abilities: List<PokemonAbility>.from(json['abilities'].map((e) => PokemonAbility.fromMap(e))),
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
      };
}

class PokemonAbility {
  bool isHidden;
  int slot;
  Ability ability;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromMap(Map<String, dynamic> json) => PokemonAbility(
        isHidden: json['is_hidden'],
        slot: json['slot'],
        ability: Ability.fromMap(json['ability']),
      );

  Map<String, dynamic> toJson() => {
    'is_hidden' : isHidden,
    'slot' : slot,
    'ability' : ability.toJson(),
  };
}

class Ability {
  String name;
  String url;

  Ability({
    required this.name,
    required this.url,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        url: json['url'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
    'name' : name,
    'url' : url,
  };
}
