import 'package:caronapp/widgets/bottomnavigationbarwidget.dart';
import 'package:flutter/material.dart';
import '../widgets/customfind.dart';
import '../widgets/customhistory.dart';
import 'cadastroveiculo.dart';

class HomeCarona extends StatelessWidget {
  const HomeCarona({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Olá, Julia',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: CustomFind(
                onPressed: () {
                  Navigator.of(context).pushNamed('/destino');
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                //CORRIGIR
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadastroVeiculo()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 48.0, right: 48.0),
                child: CustomHistory(
                  title: 'IESB Sul',
                  subtitle: 'SGAS Quadra 613/614, Via L2 Sul',
                  iconAsset: "assets/images/carona_icon.svg",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //CORRIGIR
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadastroVeiculo()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 48.0, right: 48.0),
                child: Divider(
                  color: Color.fromRGBO(177, 176, 180, 0.612),
                  thickness: 1,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //CORRIGIR
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadastroVeiculo()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 48.0, right: 48.0),
                child: CustomHistory(
                  title: 'Casa',
                  subtitle: 'QE 38, Guará',
                  iconAsset: "assets/images/carona_icon.svg",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
