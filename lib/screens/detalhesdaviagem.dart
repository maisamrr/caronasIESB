import 'package:caronapp/const.dart';
import 'package:caronapp/widgets/custominfobox.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import '../services/viagem_service.dart';
import '../widgets/bottonnav.dart';

class DetalhesDaViagem extends StatefulWidget {
  const DetalhesDaViagem({super.key});

  @override
  State<DetalhesDaViagem> createState() => _DetalhesDaViagemState();
}

class _DetalhesDaViagemState extends State<DetalhesDaViagem> {
  String? name;
  String? horario;
  String? partida;
  String? destino;
  String? status;
  String? data;
  String? placa;
  String? marca;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
    pegarDadosViagem();
  }

  pegarDadosViagem() async {
    ViagemService viagemService = ViagemService();

    var tripData = await viagemService.getTripsByUser();

    if (tripData.isNotEmpty) {
      Map<dynamic, dynamic> viagemAtual = tripData.last;

      setState(() {
        partida = viagemAtual['partida'];
        destino = viagemAtual['chegada'];
        horario = viagemAtual['horario'];
        status = viagemAtual['status'];
        data = viagemAtual['data'];
        marca = viagemAtual['car']['marca'];
        placa = viagemAtual['car']['placa'];
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
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Resumo da Viagem',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              //data
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 40.0),
                child: Text(
                  data ?? '',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomInfoBox(
                  boldText: 'Status da Viagem',
                  lightText: status ?? '',
                  iconData: Icons.cached_outlined),
              CustomInfoBox(
                  boldText: 'Horário',
                  lightText: horario ?? '',
                  iconData: Icons.schedule_outlined),
              CustomInfoBox(
                  boldText: 'Partida',
                  lightText: partida ?? '',
                  iconData: Icons.location_on_outlined),
              CustomInfoBox(
                  boldText: 'Destino',
                  lightText: destino ?? '',
                  iconData: Icons.emoji_flags_outlined),
              CustomInfoBox(
                  boldText: 'Motorista',
                  lightText: name ?? '',
                  iconData: Icons.account_circle_outlined),
              CustomInfoBox(
                  boldText: 'Veículo',
                  lightText: '${marca ?? ''} ${placa ?? ''}',
                  iconData: Icons.directions_car_outlined),
              const CustomInfoBox(
                  boldText: 'Passageiro 1',
                  lightText: 'Gustavo Pedro',
                  iconData: Icons.account_circle_outlined),
              const CustomInfoBox(
                  boldText: 'Passageiro 2',
                  lightText: 'Felipe Louzada',
                  iconData: Icons.account_circle_outlined),
              const CustomInfoBox(
                  boldText: 'Passageiro 3',
                  lightText: 'Luís Loli',
                  iconData: Icons.account_circle_outlined),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}
