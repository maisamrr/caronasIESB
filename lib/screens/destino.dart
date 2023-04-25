import 'package:caronapp/widgets/destinationfield.dart';
import 'package:flutter/material.dart';

class Destino extends StatelessWidget {
  const Destino({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 40.0),
                child: Text(
                  'Destino',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: DestinationField(
                onPressed: () {},
                icon: Icons.person_pin_circle_outlined,
                text: 'QE 38, Guará',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: DestinationField(
                onPressed: () {},
                icon: Icons.flag,
                text: 'IESB Sul',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
