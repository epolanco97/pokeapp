import 'package:flutter/material.dart';
import 'package:pokeapi/api/api_class.dart';
import 'package:pokeapi/models/pokemon_batch.dart';
import 'package:pokeapi/models/pokemon_model.dart';


class PokemonsProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  Pokemon? pokemon;

  void getPokemon(String path) async{
    final resp = await ApiClass.httpGet(path);
    pokemon = Pokemon.fromMap(resp);
    notifyListeners();
  }
  
  void getPokemonAux(String path) async{
    final resp = await ApiClass.httpGetWithoutBase(path);
    pokemons.add(Pokemon.fromMap(resp));
    // notifyListeners();
  }

  void getPokemons(String path, [int? limit, int? offset]) async{
    final resp = await ApiClass.httpGet(path, limit, offset);
    final pokemonBatchList = PokemonLinkBatch.fromMap(resp).pokemonBatchList;
    pokemonBatchList.map((e) => getPokemonAux(e.url)); 
    notifyListeners();
  }
}