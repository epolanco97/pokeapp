import 'dart:convert';

import 'package:pokeapi/models/game_indices_model.dart';
import 'package:pokeapi/models/pokemon_ability_model.dart';
import 'package:pokeapi/models/pokemon_sprites.dart';
import 'package:pokeapi/models/pokemon_type.dart';

class Pokemons {
  List<Pokemon> pokemons;

  Pokemons({required this.pokemons});

  factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        pokemons: List<Pokemon>.from(json['results'].map((e) => Pokemon.fromMap(e))),
      );

  factory Pokemons.fromList(List<dynamic> json) => Pokemons(
        pokemons: json.map((e) => Pokemon.fromMap(e)).toList(),
      );
}

class Pokemon {
  int id;
  String name;
  int height;
  int weight;
  PokemonAbilities abilities;
  PokemonSprites sprites;
  PokemonTypes types;
  GameIndices versions;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.sprites,
    required this.types,
    required this.versions,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        height: json['height'],
        weight: json['weight'],
        abilities: PokemonAbilities.fromMap(json),
        sprites: PokemonSprites.fromMap(json['sprites']),
        types: PokemonTypes.fromMap(json),
        versions: GameIndices.fromMap(json),
      );

  static Map<String, dynamic> toJson(Pokemon pokemon) => {
        "id": pokemon.id,
        "name": pokemon.name,
        "height": pokemon.height,
        "weight": pokemon.weight,
        "abilities": pokemon.abilities.toJson()['abilities'],
        "sprites": pokemon.sprites.toJson(),
        "types": pokemon.types.toJson()['types'],
        "game_indices": pokemon.versions.toJson()['game_indices'],
      };

  static String encode(List<Pokemon> pokemons) => jsonEncode(pokemons.map<Map<String, dynamic>>((pokemon) => Pokemon.toJson(pokemon)).toList());

  static List<Pokemon> decode(String pokemons) => (json.decode(pokemons) as List<dynamic>).map<Pokemon>((item) => Pokemon.fromMap(item)).toList();
}
