import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomFloatingButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: Icon(icon, color: Colors.white, size: 30,),
          backgroundColor: const Color(0xFF673AB7),
          onPressed: onPressed,
        );
  }
}