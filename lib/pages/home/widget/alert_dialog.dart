import 'package:flutter/material.dart';
import 'package:pokeapi/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  int quantity = 10;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text(
        'Limite de busqueda',
      ),
      content: SizedBox(
        height: size.height * 0.10,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (quantity >= 10) ? () => setState(() => quantity = quantity - 10) : null, icon: const Icon(Icons.remove, color: Colors.red)),
              Text(
                '$quantity',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              IconButton(onPressed: () => setState(() => quantity = quantity + 10), icon: const Icon(Icons.add, color: Colors.green)),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey),)),
        TextButton(
            onPressed: () {
              Provider.of<PokemonsProvider>(context, listen: false).getPokemons('pokemon?limit=$quantity');
              Navigator.pop(context);
            },
            child: const Text('Buscar')),
      ],
    );
  }
}
