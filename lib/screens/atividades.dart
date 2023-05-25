import 'package:caronapp/const.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/faq.dart';
import 'package:caronapp/screens/historicodecaronas.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:caronapp/widgets/customhistory.dart';
import 'package:caronapp/widgets/roundpicturewithlikes.dart';
import 'package:flutter/material.dart';
import '../models/address.dart';
import '../models/savedaddress.dart';
import '../widgets/addresstile.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/bottonnav.dart';
import '../widgets/roundsquareicon.dart';

class Atividades extends StatefulWidget {
  const Atividades({super.key});

  @override
  _Atividades createState() => _Atividades();
}

class _Atividades extends State<Atividades> {
  SavedAddress savedAddress = SavedAddress();
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    List<Address> addresses = savedAddress.savedAddress;

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
                  padding: EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Text(
                    'Julia Paiva',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ],
            ),
            //FOTO + LIKES
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: RoundProfilePictureWithLikes(
                photoPath: 'assets/images/imgprofilejulia.png',
                size: 120,
                thumbsUpCount: 10,
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
                  onTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PerfilUsuario()))
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: GestureDetector(
                    child: const RoundedSquareIcon(
                      icon: Icons.email,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContatoSuporte())),
                  ),
                ),
                GestureDetector(
                  child: const RoundedSquareIcon(
                    icon: Icons.info_sharp,
                  ),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Faq())),
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
            //filha - LISTA

            Container(
              height: 380,
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressTile(
                    address: address,
                    onPressed: () {},
                  );
                },
              ),
            ),
            //HISTORICO
            GestureDetector(
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 16.0, left: 40.0, right: 40.0, bottom: 24.0),
                  child: Text(
                    'Ver todo o histórico',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () => (Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoricoDeCaronas()))),
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNav(
        onTabChange: (index) => {},
      ),
    );
  }
}
