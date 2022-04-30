import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_ability_model.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.pokemonColor,
    
  }) : super(key: key);

  final Color pokemonColor;
  

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<PokemonsProvider>(context).pokemon!;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 75,
            child: TabBar(
              labelColor: pokemonColor,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.transparent,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: pokemonColor),
                insets: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              tabs: const [
                Tab(text: 'Abilities'),
                Tab(text: 'Sprites'),
                Tab(text: 'Games'),
              ],
            ),
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Main Abilities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                      for (PokemonAbility ability in pokemon.abilities.abilities)
                        if (!ability.isHidden) Text(ability.ability.name),
                      const SizedBox(height: 20),
                      const Text('Hidden Abilities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                      for (PokemonAbility ability in pokemon.abilities.abilities)
                        if (ability.isHidden) Text(ability.ability.name)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Image.network(pokemon.sprites.frontDefault),
                      Image.network(pokemon.sprites.frontShiny),
                      Image.network(pokemon.sprites.backDefault),
                      Image.network(pokemon.sprites.backShiny),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(pokemon.versions.games.length, (index) {
                        return Text(pokemon.versions.games[index].version.name,);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
