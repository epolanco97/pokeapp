import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Bulbasaur',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30, letterSpacing: 3.0),
                      ),
                      Text(
                        '#206',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: size.height * 0.55,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                ),
              ],
            ),
            Positioned(
                top: size.height * 0.22,
                left: size.width * 0.28,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.24,
                      maxHeight: size.height * 0.24,
                    ),
                    child: Image.network(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png',
                      fit: BoxFit.fill,
                    ))),
          ],
        ),
      ),
    );
  }
}
