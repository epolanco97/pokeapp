import 'package:pokeapi/models/game_indices_model.dart';
import 'package:pokeapi/models/pokemon_ability_model.dart';
import 'package:pokeapi/models/pokemon_sprites.dart';
import 'package:pokeapi/models/pokemon_type.dart';


//TODO pokemon batch https://pokeapi.co/api/v2/pokemon?limit=10&offset=100 como hacer el parsing de url ?
class Pokemons {
  List<Pokemon> pokemons;

  Pokemons({required this.pokemons});

  factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        pokemons: List<Pokemon>.from(json['results'].map((e) => Pokemon.fromMap(e))),
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
        sprites: PokemonSprites.fromMap(json),
        types: PokemonTypes.fromMap(json),
        versions: GameIndices.fromMap(json),
      );
}
