import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/widgets/destinationfield.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/custombutton.dart';
import '../widgets/customdivider.dart';
import '../widgets/customdriver.dart';
import '../widgets/customhistory.dart';
import '../widgets/roundsmallavatar.dart';

class HistoricoDaViagem extends StatelessWidget {
  const HistoricoDaViagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Histórico da Viagem',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              //data
              Padding(
                padding: EdgeInsets.only(top: 32.0, left: 40.0),
                child: Text(
                  'Viagem em 23/02/2023',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //hora
              Padding(
                padding: EdgeInsets.only(top: 32.0, left: 40.0),
                child: Text(
                  'Horário: 18h37',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              //endereco partida
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0),
                child: Text(
                  'Partida: QE 38, Guará',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              //endereco chegada
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0),
                child: Text(
                  'Chegada: SGAS Quadra 613/614, Via L2 Sul',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
              //motorista
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                child: RoundSmallAvatar(
                  photoPath: 'assets/images/imgprofilejulia.png',
                ),
              ),
              //infos do veículo
              //outros passageiros
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
