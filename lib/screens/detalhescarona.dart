import 'package:caronapp/const.dart';
import 'package:caronapp/screens/homecarona.dart';
import 'package:caronapp/widgets/customdriver.dart';
import 'package:caronapp/widgets/customsecondarybutton.dart';
import 'package:flutter/material.dart';
import '../widgets/custompassenger.dart';

class DetalhesCarona extends StatelessWidget {
  const DetalhesCarona({super.key});

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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: Text(
                    'Detalhes da carona',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
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
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/imgmapa.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //COMPARTILHAR
                    CustomSecondaryButton(
                      text: 'Compartilhar',
                      onPressed: () {
                        showCompartilharDialog(context);
                      },
                    ),
                    //CANCELAR
                    CustomSecondaryButton(
                      text: 'Cancelar',
                      onPressed: () {
                        showCancelarDialog(context);
                      },
                    ),
                  ],
                ),
              ),
              //MOTORISTA
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Motorista',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: CustomDriver(
                  driverName: 'Julia Paiva',
                ),
              ),
              //PASSAGEIROS
              const Padding(
                padding: EdgeInsets.only(left: 48.0, right: 48.0, bottom: 16.0),
                child: Text(
                  'Passageiros',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomPassenger(
                passengerName: 'Felipe Lousada',
                passengerAddress: 'ABC 49',
                passengerHour: DateTime.now(),
                containerColor: const Color(0xffff8ac5),
              ),
              CustomPassenger(
                passengerName: 'Gustavo Pedro',
                passengerAddress: 'Rua 55',
                passengerHour: DateTime.now(),
                containerColor: const Color(0xff57ABFF),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomPassenger(
                  passengerName: 'Maísa Moreira',
                  passengerAddress: 'Rua Flutter',
                  passengerHour: DateTime.now(),
                  containerColor: const Color(0xffFFAB57),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

void showCompartilharDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeCarona()));
    },
  );

  AlertDialog compartilhar = AlertDialog(
    title: const Text('Compartilhar corrida'),
    content: const Text('Lorem ipsum.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return compartilhar;
    },
  );
}

void showCancelarDialog(BuildContext context) {
  Widget simButton = TextButton(
    child: const Text('Sim'),
    onPressed: () {
      // Ação do botão sim
    },
  );
  Widget naoButton = TextButton(
    child: const Text('Não'),
    onPressed: () {
      // Ação do botão não
    },
  );

  AlertDialog cancelar = AlertDialog(
    title: const Text('Cancelar'),
    content: const Text('Você deseja cancelar a corrida atual?'),
    actions: [
      simButton,
      naoButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return cancelar;
    },
  );
}
