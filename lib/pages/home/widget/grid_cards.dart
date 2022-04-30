import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/details/detail_page.dart';
import 'package:pokeapi/pages/home/widget/pokemon_card.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class GridCards extends StatelessWidget {
  const GridCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonProvider = Provider.of<PokemonsProvider>(context);
    return Expanded(
        child: (pokemonProvider.pokemons.isNotEmpty)
            ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: sliverDelegates(size),
                itemCount: pokemonProvider.pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Pokemon pokemon = pokemonProvider.pokemons[index];
                  return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)),
                          ),
                      child: PokemonCard(pokemon: pokemon));
                })
            : const Center(
                child: CircularProgressIndicator(
                color: Color(0xFF673AB7),
              )));
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
