class PokemonTypes {
  List<PokemonType> typesList;

  PokemonTypes({required this.typesList});

  factory PokemonTypes.fromMap(Map<String, dynamic> json) => PokemonTypes(
        typesList: List<PokemonType>.from(json['types'].map((e) => PokemonType.fromMap(e))),
      );

      Map<String, dynamic> toJson() => {
        "types" : List<dynamic>.from(typesList.map((x) => x.toJson())),
      };
}

class PokemonType {
  int slot;
  PType type;

  PokemonType({required this.slot, required this.type});

  factory PokemonType.fromMap(Map<String, dynamic> json) => PokemonType(
        slot: json['slot'],
        type: PType.fromMap(json['type']),
      );

    Map<String, dynamic> toJson() => {
      "slot" : slot,
      "type" : type.toJson()
    };
}

class PType {
  String url;
  String name;

  PType({required this.url, required this.name});

  factory PType.fromMap(Map<String, dynamic> json) => PType(url: json['url'], name: json['name']);

  Map<String,dynamic> toJson() => {
    "url" : url,
    "name" : name,
  };
}
