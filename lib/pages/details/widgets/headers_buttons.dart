import 'package:flutter/material.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class HeadersButtons extends StatelessWidget {
  const HeadersButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonsProvider = Provider.of<PokemonsProvider>(context);
    final pokemon = pokemonsProvider.pokemon!;
    bool isFavorite = pokemonsProvider.isFav(pokemon.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackButton(
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            if (isFavorite) {
              pokemonsProvider.deleteFav(pokemon);
            } else {
              pokemonsProvider.addToFav(pokemon);
            }
          },
          icon: (isFavorite)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                ),
        )
      ],
    );
  }
}
