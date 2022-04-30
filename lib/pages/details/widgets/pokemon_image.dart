import 'package:flutter/material.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokemon = Provider.of<PokemonsProvider>(context).pokemon!;
    return Positioned(
      top: size.height * 0.18,
      left: size.width * 0.28,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height * 0.24,
          maxHeight: size.height * 0.24,
        ),
        child: Image.network(
          pokemon.sprites.frontDefault,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
