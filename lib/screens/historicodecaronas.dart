import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/widgets/destinationfield.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/custombutton.dart';
import '../widgets/customdivider.dart';
import '../widgets/customhistory.dart';
import 'historicodaviagem.dart';

class HistoricoDeCaronas extends StatelessWidget {
  const HistoricoDeCaronas({super.key});

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
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Histórico de Caronas',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: CustomHistory(
                      title: 'IESB Sul',
                      subtitle: 'SGAS Quadra 613/614, Via L2 Sul',
                      iconAsset: "assets/images/carona_icon.svg",
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoricoDaViagem()))
                },
              ),
              const CustomDivider(),
              GestureDetector(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: CustomHistory(
                      title: 'Casa',
                      subtitle: 'QE 38, Guará',
                      iconAsset: "assets/images/carona_icon.svg",
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoricoDaViagem()))
                },
              ),
              const CustomDivider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: CustomHistory(
                    title: 'Conjunto Nacional',
                    subtitle: 'SDN, CNB - Asa Norte',
                    iconAsset: "assets/images/carona_icon.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
