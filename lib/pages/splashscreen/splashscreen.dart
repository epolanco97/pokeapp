import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/providers/connection_check.dart';
import 'package:pokeapi/routes/routes_names.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) { 
      Future.delayed(const Duration(milliseconds: 2800)).then((value) async {
        Provider.of<ConnectionCheck>(context, listen: false).connectionCheck = await DataConnectionChecker().hasConnection;
        Navigator.pushReplacementNamed(context, RoutesNames.homePage);
      });
    });
    return const Scaffold(
      backgroundColor:  Color(0xffEBEDEC),
      body: Center(
        child: Image(
            image: AssetImage('assets/splash.gif'),
          ),
      ),
    );
  }
}