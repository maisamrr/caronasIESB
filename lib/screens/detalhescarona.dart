import 'package:caronapp/widgets/customdriver.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/custompassenger.dart';

class DetalhesCarona extends StatelessWidget {
  const DetalhesCarona({super.key});

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
                  padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: Text(
                    'Detalhes da carona',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 48.0, right: 48.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/imgmapa.png',
                    ),
                  ),
                ),
              ),
              //MOTORISTA
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Motorista',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              //FIM MOTORISTA
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: CustomDriver(
                  driverName: 'Julia Paiva',
                ),
              ),
              //PASSAGEIROS
              CustomPassenger(
                passengerName: 'Felipe Lousada',
                passengerAddress: 'ABC 49',
                passengerHour: DateTime.now(),
                icon: Icons.cancel,
                iconText: 'Cancelar',
                containerColor: const Color(0xffff8ac5),
              ),
              CustomPassenger(
                passengerName: 'Gustavo Pedro',
                passengerAddress: 'Rua 55',
                passengerHour: DateTime.now(),
                icon: Icons.report,
                iconText: 'Reportar',
                containerColor: const Color(0xff57ABFF),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomPassenger(
                  passengerName: 'Maísa Moreira',
                  passengerAddress: 'Rua Flutter',
                  passengerHour: DateTime.now(),
                  icon: Icons.phone_in_talk,
                  iconText: 'Contatar',
                  containerColor: const Color(0xffFFAB57),
                ),
              ),
            ],
          ),
        ),
      ),
            bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
