import 'package:flutter/material.dart';
import 'package:pokeapi/api/api_class.dart';
import 'package:pokeapi/models/pokemon_batch.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/services/local_storage.dart';

class PokemonsProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  List<Pokemon> favPokemons = [];
  Pokemon? pokemon;

  Future<void> getPokemons(String path) async {
    pokemons.clear();

    final resp = await ApiClass.httpGet(path);

    PokemonLinkBatch.fromMap(resp['results']).pokemonBatchList.map((e) async {
      final resp = await ApiClass.httpGetWithoutBase(e.url);
      pokemons.add(Pokemon.fromMap(resp));
      notifyListeners();
    }).toList();

    notifyListeners();
  }

  bool isFav(int id) {
    final auxFav = favPokemons.map((e) => e.id).toList();
    return auxFav.contains(id);
  }

  Future<void> addToFav(Pokemon pokemon) async {
    favPokemons = [...favPokemons, pokemon];
    final String encodedData = Pokemon.encode(favPokemons);
    await LocalStorage.prefs.setString('favPokemons', encodedData);
    final String pokemonString = LocalStorage.prefs.getString('favPokemons')!;
    favPokemons = Pokemon.decode(pokemonString);
    notifyListeners();
  }

  deleteFav(Pokemon pokemon) {
    favPokemons.remove(pokemon);
    notifyListeners();
  }

  clearFavPokemons() {
    favPokemons.clear();
    notifyListeners();
  }
}
