import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:flutter/material.dart';

class RoundedSquareIcon extends StatelessWidget {
  final IconData icon;

  const RoundedSquareIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Icon(
            icon,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }
}
