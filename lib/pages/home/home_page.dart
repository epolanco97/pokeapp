import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/home/widget/pokemon_card.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemonProvider = Provider.of<PokemonsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                  child: (pokemonProvider.pokemons.isNotEmpty)
                      ? GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: sliverDelegates(size),
                          itemCount: pokemonProvider.pokemons.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Pokemon pokemon = pokemonProvider.pokemons[index];
                            return PokemonCard(pokemon: pokemon);
                          })
                      : const Center(child: Text("Sin elementos para mostrar"))),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.filter, color: Colors.white,),
        backgroundColor: Colors.deepPurple,
        onPressed: (){},
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount sliverDelegates(Size size) {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: (size.height < 700)
            ? size.height * 0.326
            : (size.height < 810)
                ? size.height * 0.31
                : size.height * 0.295);
  }
}
