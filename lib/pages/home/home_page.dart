import 'package:flutter/material.dart';
import 'package:pokeapi/pages/home/widget/alert_dialog.dart';
import 'package:pokeapi/pages/home/widget/grid_cards.dart';
import 'package:pokeapi/pages/home/widget/header_title.dart';
import 'package:pokeapi/pages/home/widget/text_connection.dart';
import 'package:pokeapi/providers/connection_check.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/shared/custom_floating_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (Provider.of<ConnectionCheck>(context, listen: false).connectionCheck) {
      Provider.of<PokemonsProvider>(context, listen: false).getPokemons('pokemon?limit=100');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonsProvider>(context);
    final connectionCheck = Provider.of<ConnectionCheck>(context).connectionCheck;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderTittle(),
                const SizedBox(
                  height: 10,
                ),
                (connectionCheck) ? const GridCards() : const TextConnection(),
              ],
            ),
          ),
        ),
        floatingActionButton: (pokemonProvider.pokemons.isNotEmpty)
            ? CustomFloatingButton(
                icon: Icons.search,
                onPressed: () {
                  showDialog(context: context, builder: (context) => const CustomAlertDialog());
                },
              )
            : null);
  }
}
