import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/services/viagem_service.dart';
import 'package:flutter/material.dart';
import '../widgets/customdriver.dart';
import '../widgets/customsecondarybutton.dart';

class AguardandoInicio extends StatefulWidget {
  const AguardandoInicio({Key? key}) : super(key: key);

  @override
  _AguardandoInicioState createState() => _AguardandoInicioState();
}

class _AguardandoInicioState extends State<AguardandoInicio> {
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

  String? name;
  String? horario;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
    pegarHorario();
  }

  pegarHorario() async {
    ViagemService viagemService = ViagemService();

    var tripData = await viagemService.getTripsByUser();

    String? horarioo = tripData[0]['horario'];

    setState(() {
      horario = horarioo;
    });
  }

  pegarNomeUser() async {
    UserService userService = UserService();

    var userData = await userService.getUserData();
    setState(() {
      name = userData!.displayName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(name);
    print(horario);
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
                                Center(
                                  child: Text(
                                    horario ?? '',
                                    style: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomDriver(
                  driverName: name ?? '',
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
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                    // children: const [
                    //   CustomDriver(
                    //     driverName: 'Gustavo Pedro',
                    //   ),
                    //   CustomDriver(
                    //     driverName: 'Felipe Louzada',
                    //   ),
                    //   CustomDriver(
                    //     driverName: 'Luis Loli',
                    //   ),
                    // ],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
