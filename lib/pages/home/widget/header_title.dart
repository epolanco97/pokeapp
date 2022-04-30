import 'package:flutter/material.dart';
import 'package:pokeapi/routes/routes_names.dart';

class HeaderTittle extends StatelessWidget {
  const HeaderTittle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
