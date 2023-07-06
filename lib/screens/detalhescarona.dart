import 'package:caronapp/const.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:caronapp/widgets/customdriver.dart';
import 'package:caronapp/widgets/custompassenger.dart';
import 'package:caronapp/widgets/customsecondarybutton.dart';
import 'package:flutter/material.dart';
import '../services/user_service.dart';
import '../services/viagem_service.dart';

class DetalhesCarona extends StatefulWidget {
  const DetalhesCarona({Key? key}) : super(key: key);

  @override
  _DetalhesCaronaState createState() => _DetalhesCaronaState();
}

class _DetalhesCaronaState extends State<DetalhesCarona> {
  late String tripId;
  String? name;
  String? horario;
  String? partida;
  String? destino;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
    pegarDadosViagem();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    tripId = ModalRoute.of(context)!.settings.arguments as String;
  }

  void showCancelarDialog(BuildContext context) {
    Widget simButton = TextButton(
      child: const Text('Sim'),
      onPressed: () async {
        // PENDENTE: mudar status da viagem atual para cancelada
        await ViagemService().setStatusViagem(tripId, StatusViagem.cancelada);
        Navigator.of(context).pushNamed('/detalhesviagem');
      },
    );
    Widget naoButton = TextButton(
      child: const Text('Não'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog cancelar = AlertDialog(
      title: const Text('Cancelar'),
      content: const Text('Você deseja cancelar a carona atual?'),
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

  void showFinalizarDialog(BuildContext context) {
    Widget simButton = TextButton(
      child: const Text('Sim'),
      onPressed: () async {
        // PENDENTE: mudar status da viagem atual para finalizada
        await ViagemService().setStatusViagem(tripId, StatusViagem.finalizada);

        Navigator.of(context).pushNamed('/detalhesviagem');
      },
    );
    Widget naoButton = TextButton(
      child: const Text('Não'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog finalizar = AlertDialog(
      title: const Text('Finalizar'),
      content: const Text('Fim da carona atual?'),
      actions: [
        simButton,
        naoButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return finalizar;
      },
    );
  }

  pegarDadosViagem() async {
    ViagemService viagemService = ViagemService();

    var tripData = await viagemService.getTripsByUser();

    if (tripData.isNotEmpty) {
      Map<dynamic, dynamic> viagemAtual = tripData.last;

      setState(() {
        partida = viagemAtual['partida'];
        destino = viagemAtual['chegada'];
      });
    }
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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, bottom: 16.0, left: 50),
                child: Text(
                  'Detalhes da carona',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: redIdColor,
                  ),
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 48.0,
                      right: 48.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/images/imgmapaatualizada.png',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomSecondaryButton(
                          text: 'Finalizar',
                          onPressed: () {
                            showFinalizarDialog(context);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomSecondaryButton(
                          text: 'Cancelar',
                          onPressed: () {
                            showCancelarDialog(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              const Padding(
                padding: EdgeInsets.only(
                  left: 48.0,
                  right: 48.0,
                  bottom: 16.0,
                ),
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
                child: CustomPassenger(
                  passengerName: 'Maísa',
                  passengerAddress: 'Rua Spring',
                  passengerHour: DateTime.now(),
                  containerColor: const Color.fromARGB(255, 137, 87, 255),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomPassenger(
                  passengerName: 'Gustavo',
                  passengerAddress: 'Rua Junit',
                  passengerHour: DateTime.now(),
                  containerColor: const Color.fromARGB(255, 255, 87, 87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomPassenger(
                  passengerName: 'Luis Loli',
                  passengerAddress: 'Rua Flutter',
                  passengerHour: DateTime.now(),
                  containerColor: const Color(0xffFFAB57),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
