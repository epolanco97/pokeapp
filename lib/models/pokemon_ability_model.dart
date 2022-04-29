class PokemonAbilities {
  List<PokemonAbility> abilities;

  PokemonAbilities({required this.abilities});

  factory PokemonAbilities.fromMap(Map<String, dynamic> json) => PokemonAbilities(
        abilities: List<PokemonAbility>.from(json['abilities'].map((e) => PokemonAbility.fromMap(e))),
      );
}

class PokemonAbility {
  bool isHidden;
  int slot;
  Ability abilities;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.abilities,
  });

  factory PokemonAbility.fromMap(Map<String, dynamic> json) => PokemonAbility(
        isHidden: json['is_hidden'],
        slot: json['slot'],
        abilities: Ability.fromMap(json['ability']),
      );
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
}
