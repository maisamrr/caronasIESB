import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:flutter/material.dart';

class RoundedSquareIcon extends StatelessWidget {
  final IconData icon;

  const RoundedSquareIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PerfilUsuario()))
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 38, 63, 51),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Icon(
              icon,
              color: Colors.black,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}
