import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/details/widgets/body_container.dart';
import 'package:pokeapi/pages/details/widgets/headers_buttons.dart';
import 'package:pokeapi/pages/details/widgets/pokemon_detail_type.dart';
import 'package:pokeapi/pages/details/widgets/pokemon_image.dart';
import 'package:pokeapi/pages/details/widgets/pokemon_name.dart';
import 'package:pokeapi/themes/theme_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/pokemons_provider.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokemonsProvider>(context, listen: false).pokemon = widget.pokemon;
  }

  @override
  Widget build(BuildContext context) {
    final Color pokemonColor = ThemeColors.typeColor(widget.pokemon.types.typesList.first.type.name).withOpacity(0.9);
    return Scaffold(
      backgroundColor: pokemonColor,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadersButtons(),
                const PokemonName(),
                const PokemonDetailType(),
                const Spacer(),
                BodyContainer(
                  pokemonColor: pokemonColor,
                ),
              ],
            ),
            const PokemonImage()
          ],
        ),
      ),
    );
  }
}
