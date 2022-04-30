import 'package:flutter/material.dart';
import 'package:pokeapi/pages/favorities/favorities.dart';
import 'package:pokeapi/pages/home/home_page.dart';
import 'package:pokeapi/pages/splashscreen/splashscreen.dart';
import 'package:pokeapi/routes/routes_names.dart';

class RoutesMap {
  static Map<String, WidgetBuilder> routes = {
    RoutesNames.homePage: (BuildContext context) => const HomePage(),
    RoutesNames.splashScreen: (BuildContext context) => const SplashScreen(),
    RoutesNames.favoritiesPage: (BuildContext context) => const FavoritiesPage(),
  };
}