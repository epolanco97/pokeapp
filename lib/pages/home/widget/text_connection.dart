import 'package:flutter/material.dart';

class TextConnection extends StatelessWidget {
  const TextConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          'No cuentas con conexión a internet, pero aun así puede ver su lista de pokemones favoritos',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
