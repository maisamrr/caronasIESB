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
        height: 29.7,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(20, 0, 0, 0),
              offset: Offset(0.0, 8.0),
              blurRadius: 20.0,
            )
          ],
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 35, 0),
              child: Text(
                'Adicione um carro',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[300],
                    fontFamily: 'Inria'),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 10, 0),
                child: Text('+',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Inria')))
          ],
        ),
      ),
    );
  }
}