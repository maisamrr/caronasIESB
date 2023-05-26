import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import '../widgets/customdriver.dart';
import '../widgets/customsecondarybutton.dart';

class AguardandoInicio extends StatelessWidget {
  const AguardandoInicio({super.key});

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
                    'Aguardando início',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              //IMAGEM
              GestureDetector(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 48.0, right: 48.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.5),
                              BlendMode.modulate,
                            ),
                            child: Image.asset(
                              'assets/images/imgmapa.png',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, bottom: 16.0),
                                    child: Image.asset(
                                      'assets/images/logovermelho.png',
                                      height: 120.0,
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      'Sua carona deve iniciar às',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      '10:57',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/detalhescarona');
                },
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //COMPARTILHAR
                    CustomSecondaryButton(
                      text: 'Compartilhar',
                      onPressed: () {},
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
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Passageiros',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: const [
                    CustomDriver(
                      driverName: 'Gustavo Pedro',
                    ),
                    CustomDriver(
                      driverName: 'Felipe Louzada',
                    ),
                    CustomDriver(
                      driverName: 'Luis Loli',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCompartilharDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.of(context).pushReplacementNamed('/pedircarona');
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
      Navigator.of(context).pushReplacementNamed('/pedircarona');
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
