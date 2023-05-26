import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/widgets/bottonnav.dart';
import 'package:caronapp/widgets/destinationfield.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../widgets/custombutton.dart';
import 'historicodecaronas.dart';

class Destino extends StatelessWidget {
  const Destino({super.key});

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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Destino',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: DestinationField(
                  onPressed: () {},
                  icon: Icons.person_pin_circle_outlined,
                  text: 'QE 38, Guará',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: DestinationField(
                  onPressed: () {},
                  icon: Icons.flag,
                  text: 'IESB Sul',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 48.0, right: 48.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/imgmapa.png',
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 48.0),
                  child: CustomButton(
                    text: 'Confirmar',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/aguardandoinicio');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(selectedIndex: 1),
    );
  }
}
