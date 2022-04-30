import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/favorities/widgets/grid_fav_cards.dart';
import 'package:pokeapi/pages/favorities/widgets/tittle_header_fav.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/services/local_storage.dart';
import 'package:pokeapi/shared/custom_floating_button.dart';
import 'package:provider/provider.dart';

class FavoritiesPage extends StatefulWidget {
  const FavoritiesPage({Key? key}) : super(key: key);

  @override
  State<FavoritiesPage> createState() => _FavoritiesPageState();
}

class _FavoritiesPageState extends State<FavoritiesPage> {
  @override
  void initState() {
    super.initState();

    if (LocalStorage.prefs.getString('favPokemons') != null) {
      final List<Pokemon> favList = Pokemon.decode(LocalStorage.prefs.getString('favPokemons')!);
      Provider.of<PokemonsProvider>(context, listen: false).favPokemons = favList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemonsProvider = Provider.of<PokemonsProvider>(context);
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TittleHeaderFav(),
                SizedBox(height: 10),
                GridFavCards(),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingButton(
            icon: Icons.delete,
            onPressed: () {
              LocalStorage.prefs.remove('favPokemons');
              pokemonsProvider.clearFavPokemons();
            }));
  }
}
