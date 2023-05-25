import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';
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
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 40.0),
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
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 32.0, left: 40.0),
                    child: Text(
                      'Horário:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32.0, left: 8.0),
                    child: Text(
                      '18:37',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              //endereco partida
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 40.0),
                    child: Text(
                      'Partida:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Casa',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              //endereco chegada
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 40.0),
                    child: Text(
                      'Chegada:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'IESB',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              //motorista
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0),
                child: Text(
                  'Motorista:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                    child: RoundSmallAvatar(
                      photoPath: 'assets/images/imgprofilejulia.png',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Julia Paiva',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              //passageiros
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 40.0),
                child: Text(
                  'Passageiros:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                    child: RoundSmallAvatar(
                      photoPath: 'assets/images/imgrandom.png',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Maísa Moreira',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                    child: RoundSmallAvatar(
                      photoPath: 'assets/images/imgrandom.png',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Gustavo Pedro',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                    child: RoundSmallAvatar(
                      photoPath: 'assets/images/imgrandom.png',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Felipe Louzada',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              //infos do veículo
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 40.0),
                    child: Text(
                      'Veículo:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text(
                      'Hyundai HB20 - BRA1234',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
