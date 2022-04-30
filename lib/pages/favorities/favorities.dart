import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/home/widget/pokemon_card.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/services/local_storage.dart';
import 'package:provider/provider.dart';

class FavoritiesPage extends StatelessWidget {
  const FavoritiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonsProvider = Provider.of<PokemonsProvider>(context);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    BackButton(
                      color: Colors.black,
                    ),
                    Text('PokeFavs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: (pokemonsProvider.favPokemons.isNotEmpty)
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: sliverDelegates(size),
                            itemCount:  pokemonsProvider.favPokemons.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Pokemon pokemon =  Provider.of<PokemonsProvider>(context, listen:false).favPokemons[index];
                              return PokemonCard(pokemon: pokemon);
                            })
                        : const Center(child: Text('No has agregado pokemones a tu lista de favoritos')))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xFF673AB7),
          onPressed: () {
            LocalStorage.prefs.remove('favPokemons');
            pokemonsProvider.clearFavPokemons();
          },
        ));
  }

  SliverGridDelegateWithFixedCrossAxisCount sliverDelegates(Size size) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 10.0,
      mainAxisExtent: size.height * 0.25,
    );
  }
}
