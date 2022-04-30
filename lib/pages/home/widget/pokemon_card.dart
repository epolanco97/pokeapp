import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/shared/pokemon_types_widget.dart';
import 'package:pokeapi/themes/theme_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(color: ThemeColors.typeColor(pokemon.types.typesList.first.type.name).withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: pokemon.sprites.frontDefault,
              placeholder: (context, url) => Image.asset('assets/no_image_network.png', color: Colors.white, height: size.height * 0.11,),
              errorWidget: (context, url, error) => Image.asset('assets/no_image_network.png', color: Colors.white, height: size.height * 0.11,),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            pokemon.name,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          PokemonTypesWidget(types: pokemon.types.typesList),
        ],
      ),
    );
  }
}
