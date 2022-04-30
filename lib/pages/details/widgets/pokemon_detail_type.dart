import 'package:flutter/material.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/shared/pokemon_types_widget.dart';
import 'package:provider/provider.dart';



class PokemonDetailType extends StatelessWidget {
  const PokemonDetailType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<PokemonsProvider>(context).pokemon!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: PokemonTypesWidget(
        types: pokemon.types.typesList,
      ),
    );
  }
}
