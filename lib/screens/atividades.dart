import 'package:caronapp/widgets/customdivider.dart';
import 'package:caronapp/widgets/customhistory.dart';
import 'package:caronapp/widgets/roundpicturewithlikes.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/roundsquareicon.dart';

class Atividades extends StatefulWidget {
  const Atividades({super.key});

  @override
  _Atividades createState() => _Atividades();
}

class _Atividades extends State<Atividades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //ROW nome
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Text(
                    'Julia Paiva',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
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
              children: const [
                RoundedSquareIcon(
                  icon: Icons.edit_document,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0, right: 32.0),
                  child: RoundedSquareIcon(
                    icon: Icons.email,
                  ),
                ),
                RoundedSquareIcon(
                  icon: Icons.info_sharp,
                ),
              ],
            ),
            //VIAGENS RECENTES
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 24.0, left: 40.0, right: 40.0, bottom: 24.0),
                child: Text(
                  'Viagens recentes',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const CustomDivider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: CustomHistory(
                  onPressed: () {},
                  title: 'IESB Sul',
                  subtitle: 'SGAS Quadra 613/614, Via L2 Sul',
                ),
              ),
            ),
            const CustomDivider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: CustomHistory(
                  onPressed: () {},
                  title: 'Casa',
                  subtitle: 'QE 38, Guará',
                ),
              ),
            ),
            const CustomDivider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: CustomHistory(
                  onPressed: () {},
                  title: 'Conjunto Nacional',
                  subtitle: 'SDN, CNB - Asa Norte',
                ),
              ),
            ),
            const CustomDivider(),
            //HISTORICO
            GestureDetector(
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 24.0, left: 40.0, right: 40.0, bottom: 24.0),
                  child: Text(
                    'Ver todo o histórico',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () => ('https://www.google.com'),
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
