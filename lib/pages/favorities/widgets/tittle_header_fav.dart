import 'package:flutter/material.dart';

class TittleHeaderFav extends StatelessWidget {
  const TittleHeaderFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BackButton(
          color: Colors.black,
        ),
        Text('PokeFavs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
      ],
    );
  }
}
