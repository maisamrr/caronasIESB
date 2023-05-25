import 'package:flutter/material.dart';
import '../screens/escolherveiculo.dart';

class AddCarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EscolherVeiculo(),
          ),
        );
      },
      child: Container(
        height: 60,
        width: 248,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFf7f5f5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 35, 0),
              child: Text(
                'Adicione um carro',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 10, 0),
                child: Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
