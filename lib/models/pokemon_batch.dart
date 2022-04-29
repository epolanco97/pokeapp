class PokemonLinkBatch {
  List<PokemonLink> pokemonBatchList;

  PokemonLinkBatch({required this.pokemonBatchList});

  factory PokemonLinkBatch.fromMap(Map<String, dynamic> json) => PokemonLinkBatch(
        pokemonBatchList: List<PokemonLink>.from(json['results'].map((e) => PokemonLink.fromMap(e))),
      );
}

class PokemonLink {
  String name;
  String url;

  PokemonLink({required this.name, required this.url});

  factory PokemonLink.fromMap(Map<String, dynamic> json) => PokemonLink(name: json['name'], url: json['url']);
}
