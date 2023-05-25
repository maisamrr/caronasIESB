import 'package:caronapp/widgets/custompersonsimple.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';

class AguardandoInicio extends StatelessWidget {
  const AguardandoInicio({super.key});

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
                    'Aguardando início da carona',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              //IMAGEM

              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 48.0, right: 48.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.35),
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
                                      top: 24,
                                      bottom: 16.0),
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

              //MOTORISTA
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Motorista',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomPersonSimple(personName: 'Julia Paiva'),
              //FIM MOTORISTA

              //PASSAGEIROS
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Passageiros',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomPersonSimple(personName: 'Gustavo Pedro'),
              CustomPersonSimple(personName: 'Felipe Louzada'),
              CustomPersonSimple(personName: 'Luís Loli'),
            ],
          ),
        ),
      ),
            //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
