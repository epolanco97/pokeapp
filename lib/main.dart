import 'package:flutter/material.dart';
import 'package:pokeapi/pages/home/home_page.dart';
import 'package:pokeapi/routes/routes_map.dart';
import 'package:pokeapi/routes/routes_names.dart';

void main() {
  runApp(const PokeApp());
}

class PokeApp extends StatelessWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeApp Demo',
      routes: RoutesMap.routes,
      initialRoute: RoutesNames.homePage,
    );
  }
}

