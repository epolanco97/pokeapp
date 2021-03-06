class PokemonLinkBatch {
  List<PokemonLink> pokemonBatchList;

  PokemonLinkBatch({required this.pokemonBatchList});

  factory PokemonLinkBatch.fromMap(List<dynamic> json) => PokemonLinkBatch(
        pokemonBatchList: json.map((e) => PokemonLink.fromMap(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "pokemonBatchList": List<dynamic>.from(pokemonBatchList.map((x) => x.toJson())),
      };
}

class PokemonLink {
  String name;
  String url;

  PokemonLink({required this.name, required this.url});

  factory PokemonLink.fromMap(Map<String, dynamic> json) => PokemonLink(name: json['name']!, url: json['url']!);

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
