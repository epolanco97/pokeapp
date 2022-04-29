class PokemonTypes {
  List<PokemonType> types;

  PokemonTypes({required this.types});

  factory PokemonTypes.fromMap(Map<String, dynamic> json) => PokemonTypes(
        types: List<PokemonType>.from(json['types'].map((e) => PokemonType.fromMap(e))),
      );
}

class PokemonType {
  int slot;
  PType type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromMap(Map<String, dynamic> json) => PokemonType(
        slot: json['slot'],
        type: PType.fromMap(json['type']),
      );
}

class PType {
  String url;
  String name;

  PType({required this.url, required this.name});

  factory PType.fromMap(Map<String, dynamic> json) => PType(url: json['url'], name: json['name']);
}
