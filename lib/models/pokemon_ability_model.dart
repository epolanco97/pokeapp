class PokemonAbilities {
  List<PokemonAbility> abilities;

  PokemonAbilities({required this.abilities});

  factory PokemonAbilities.fromMap(Map<String, dynamic> json) => PokemonAbilities(
        abilities: List<PokemonAbility>.from(json['abilities'].map((e) => PokemonAbility.fromMap(e))),
      );
}

class PokemonAbility {
  bool isHidden;
  String slot;
  Ability abilities;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.abilities,
  });

  factory PokemonAbility.fromMap(Map<String, dynamic> json) => PokemonAbility(
        isHidden: json['is_hidden'],
        slot: json['slot'],
        abilities: Ability.fromMap(json),
      );
}

class Ability {
  String id;
  String name;

  Ability({
    required this.id,
    required this.name,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        id: json['id'],
        name: json['name'],
      );
}
