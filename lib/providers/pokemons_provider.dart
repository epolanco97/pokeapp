import 'package:flutter/material.dart';
import 'package:pokeapi/api/api_class.dart';
import 'package:pokeapi/models/pokemon_batch.dart';
import 'package:pokeapi/models/pokemon_model.dart';

class PokemonsProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  Pokemon? pokemon;

  PokemonsProvider(){
    getPokemons('pokemon?limit=100');
  }

  void getPokemon(String path) async {
    final resp = await ApiClass.httpGet(path);
    pokemon = Pokemon.fromMap(resp);
    notifyListeners();
  }

  void getPokemons(String path) async {
    final resp = await ApiClass.httpGet(path);

    PokemonLinkBatch.fromMap(resp['results']).pokemonBatchList.map((e) async {
      final resp = await ApiClass.httpGetWithoutBase(e.url);
      pokemons.add(Pokemon.fromMap(resp));
      notifyListeners();
    }).toList();
  }
}
