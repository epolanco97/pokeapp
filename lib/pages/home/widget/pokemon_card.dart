import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final types = pokemon.types.types.map((e) => Text(e.type.name)).toList();
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(pokemon.name),
          Row(
            children: [
              Column(children: [
                ...types
              ],),
              
              Image.network(pokemon.sprites.frontDefault),
            ],
          ),
        ],
      ),
    );
  }
}
