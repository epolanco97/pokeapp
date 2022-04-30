import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_type.dart';
import 'package:pokeapi/themes/theme_colors.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<PokemonType> types;
  const PokemonTypesWidget({Key? key, required this.types}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(types.length, (index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: const EdgeInsets.only(right: 4, top: 3),
          decoration: BoxDecoration(
            color: ThemeColors.typeColor(types[index].type.name).withOpacity(1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            types[index].type.name,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
