import 'package:flutter/material.dart';
import 'package:pokeapi/pages/details/widgets/detail_body.dart';

class BodyContainer extends StatelessWidget {
  final Color pokemonColor;
  const BodyContainer({Key? key, required this.pokemonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   Container(
                  height: size.height * 0.55,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: DetailBody(pokemonColor: pokemonColor),
                );
  }
}