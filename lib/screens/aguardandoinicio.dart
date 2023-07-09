import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/services/viagem_service.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:flutter/material.dart';
import '../widgets/customdriver.dart';
import '../widgets/customsecondarybutton.dart';

class AguardandoInicio extends StatefulWidget {
  const AguardandoInicio({Key? key}) : super(key: key);

  @override
  _AguardandoInicioState createState() => _AguardandoInicioState();
}

class _AguardandoInicioState extends State<AguardandoInicio> {
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

  void showIniciarDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text('OK'),
      onPressed: () async {
        await ViagemService().setStatusViagem(tripId, StatusViagem.emCurso);
        Navigator.of(context)
            .pushReplacementNamed('/detalhescarona', arguments: tripId);
      },
    );

    AlertDialog iniciar = AlertDialog(
      title: const Text('Iniciar corrida'),
      content: const Text('Após a confirmação, sua corrida será iniciada.'),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return iniciar;
      },
    );
  }

  void showCancelarDialog(BuildContext context) {
    Widget simButton = TextButton(
      child: const Text('Sim'),
      onPressed: () async {
        await ViagemService().setStatusViagem(tripId, StatusViagem.cancelada);
        Navigator.of(context).pushReplacementNamed('/pedircarona');
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

  pegarDadosViagem() async {
    ViagemService viagemService = ViagemService();

    var tripData = await viagemService.getTripsByUser();

    String? horarioo = tripData.last['horario'];

    if (tripData.isNotEmpty) {
      Map<dynamic, dynamic> viagemAtual = tripData.last;

      setState(() {
        partida = viagemAtual['partida'];
        destino = viagemAtual['chegada'];
        horario = horarioo;
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
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 16.0,
                  left: 55.0,
                  right: 16.0,
                ),
                child: Text(
                  'Aguardando início',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w900,
                    color: redIdColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 48.0,
                      right: 48.0,
                    ),
                  child: SizedBox(
                    width: double.infinity,
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
                              'assets/images/imgmapaatualizada.png',
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 16.0,
                                  ),
                                  child: Image.asset(
                                    'assets/images/logovermelho.png',
                                    height: 60.0,
                                  ),
                                ),
                                const Text(
                                  'Sua carona deve iniciar às',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  horario ?? '',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                          text: 'Iniciar',
                          onPressed: () {
                            showIniciarDialog(context);
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
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Partida',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 48.0,
                  right: 48.0,
                  bottom: 16.0,
                ),
                child: Text(
                  partida ?? '',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0, left: 48.0, right: 48.0),
                child: Text(
                  'Destino',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 48.0,
                  right: 48.0,
                  bottom: 16.0,
                ),
                child: Text(
                  destino ?? '',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
