import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/services/viagem_service.dart';
import 'package:caronapp/widgets/addresstile.dart';
import 'package:caronapp/widgets/roundpicturewithlikes.dart';
import 'package:flutter/material.dart';
import '../widgets/bottonnav.dart';
import '../widgets/roundsquareicon.dart';

class Atividades extends StatefulWidget {
  const Atividades({super.key});

  @override
  _Atividades createState() => _Atividades();
}

class _Atividades extends State<Atividades> {
  String? name;

  List<String> locals = [];
  List<String> hora = [];
  List<String> data = [];
  int? length;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
    pegarViagensUser();
  }

  pegarNomeUser() async {
    UserService userService = UserService();

    var userData = await userService.getUserData();
    setState(() {
      name = userData!.displayName!;
    });
  }

  pegarViagensUser() async {
    ViagemService viagemService = ViagemService();

    var tripData = await viagemService.getTripsByUser();

    List<String> localNames = [];
    List<String> horaNames = [];
    List<String> dataNames = [];

    for (var endereco in tripData) {
      String addressName = endereco['partida'];
      String addressHourId = endereco['horario'];
      String addressDateNumber = endereco['data'];
      localNames.add(addressName);
      horaNames.add(addressHourId);
      dataNames.add(addressDateNumber);
    }
    print(tripData.length);

    setState(() {
      locals = localNames;
      hora = horaNames;
      data = dataNames;
    });
  }

  @override
  Widget build(BuildContext context) {
    //List<Address> addresses = savedAddress.savedAddress;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //ROW nome
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Text(
                    name ?? '',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ],
            ),
            //FOTO
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: RoundProfilePictureWithLikes(
                photoPath: 'assets/images/imgrandom.png',
                size: 120,
              ),
            ),
            //ROW ícones do menu
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const RoundedSquareIcon(
                    icon: Icons.edit_document,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/perfilusuario');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: GestureDetector(
                    child: const RoundedSquareIcon(
                      icon: Icons.email,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/contatosuporte');
                    },
                  ),
                ),
                GestureDetector(
                  child: const RoundedSquareIcon(
                    icon: Icons.info_sharp,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/faq');
                  },
                ),
              ],
            ),
            //VIAGENS RECENTES
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 40.0, left: 40.0, right: 40.0, bottom: 16.0),
                child: Text(
                  'Viagens recentes',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //LISTA
            SizedBox(
              height: 380,
              child: ListView.builder(
                itemCount: locals.length,
                itemBuilder: (context, index) {
                  return AddressTile(
                    apelido: locals[index],
                    rua: hora[index],
                    numero: data[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 2),
    );
  }
}
