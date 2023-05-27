import 'package:caronapp/const.dart';
import 'package:caronapp/widgets/custominfobox.dart';
import 'package:flutter/material.dart';

class DetalhesDaViagem extends StatelessWidget {
  const DetalhesDaViagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/atividades');
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Detalhes da Viagem',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              //data
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 40.0),
                child: Text(
                  'Viagem em 23/02/2023',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomInfoBox(
                  boldText: 'Horário',
                  lightText: '18:37',
                  iconData: Icons.schedule_outlined),
              CustomInfoBox(
                  boldText: 'Partida',
                  lightText: 'SQS 116 Bloco J',
                  iconData: Icons.location_on_outlined),
              CustomInfoBox(
                  boldText: 'Chegada',
                  lightText: 'Iesb Sul',
                  iconData: Icons.emoji_flags_outlined),
              CustomInfoBox(
                  boldText: 'Motorista',
                  lightText: 'Julia Paiva',
                  iconData: Icons.account_circle_outlined),
                  CustomInfoBox(
                  boldText: 'Veículo',
                  lightText: 'Hyundai HB20 - BRA1234',
                  iconData: Icons.directions_car_outlined),
              CustomInfoBox(
                  boldText: 'Passageiro',
                  lightText: 'Gustavo Pedro',
                  iconData: Icons.account_circle_outlined),
              CustomInfoBox(
                  boldText: 'Passageiro',
                  lightText: 'Felipe Louzada',
                  iconData: Icons.account_circle_outlined),
                  SizedBox(height: 24,)
            ],
          ),
        ),
      ),
    );
  }
}
