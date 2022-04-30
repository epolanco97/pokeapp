import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/home/widget/pokemon_card.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class GridFavCards extends StatelessWidget {
  const GridFavCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonsProvider = Provider.of<PokemonsProvider>(context);
    return Expanded(
                    child: (pokemonsProvider.favPokemons.isNotEmpty)
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: sliverDelegates(size),
                            itemCount: pokemonsProvider.favPokemons.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Pokemon pokemon = Provider.of<PokemonsProvider>(context, listen: false).favPokemons[index];
                              return PokemonCard(pokemon: pokemon);
                            })
                        : const Center(child: Text('Agrega pokemones a tu lista de favoritos')));
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