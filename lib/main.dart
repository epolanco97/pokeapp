import 'package:flutter/material.dart';

import 'package:pokeapi/providers/connection_check.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:pokeapi/routes/routes_map.dart';
import 'package:pokeapi/routes/routes_names.dart';
import 'package:pokeapi/services/local_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ConnectionCheck(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PokemonsProvider(),
        ),
      ],
      child: const PokeApp(),
    );
  }
}

class PokeApp extends StatelessWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeApp Demo',
      routes: RoutesMap.routes,
      initialRoute: RoutesNames.splashScreen,
    );
  }
}
