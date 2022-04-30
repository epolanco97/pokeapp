import 'package:flutter/material.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class PokemonName extends StatelessWidget {
  const PokemonName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<PokemonsProvider>(context).pokemon!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pokemon.name,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30, letterSpacing: 3.0),
          ),
          Text(
            '#${pokemon.id}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
