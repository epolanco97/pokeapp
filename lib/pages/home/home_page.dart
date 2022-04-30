import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/details/detail_page.dart';
import 'package:pokeapi/pages/home/widget/alert_dialog.dart';
import 'package:pokeapi/pages/home/widget/pokemon_card.dart';
import 'package:pokeapi/providers/connection_check.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/routes/routes_names.dart';
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
    final size = MediaQuery.of(context).size;
    final pokemonProvider = Provider.of<PokemonsProvider>(context);
    final connectionCheck = Provider.of<ConnectionCheck>(context).connectionCheck;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('PokeApp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                    IconButton(
                        onPressed: () => Navigator.pushNamed(context, RoutesNames.favoritiesPage),
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                (connectionCheck)
                    ? Expanded(
                        child: (pokemonProvider.pokemons.isNotEmpty)
                            ? GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate: sliverDelegates(size),
                                itemCount: pokemonProvider.pokemons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Pokemon pokemon = pokemonProvider.pokemons[index];
                                  return InkWell(
                                      borderRadius: BorderRadius.circular(25),
                                      onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)),
                                          ),
                                      child: PokemonCard(pokemon: pokemon));
                                })
                            : const Center(
                                child: CircularProgressIndicator(
                                color: Color(0xFF673AB7),
                              )))
                    : const Expanded(
                        child: Center(
                          child: Text(
                            'No cuentas con conexión a internet, pero aun así puede ver su lista de pokemones favoritos',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: (pokemonProvider.pokemons.isNotEmpty)
            ? FloatingActionButton(
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xFF673AB7),
                onPressed: () {
                  showDialog(context: context, builder: (context) => const CustomAlertDialog());
                },
              )
            : null);
  }

  SliverGridDelegateWithFixedCrossAxisCount sliverDelegates(Size size) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 10.0,
      mainAxisExtent: size.height * 0.25,
    );
  }
}
