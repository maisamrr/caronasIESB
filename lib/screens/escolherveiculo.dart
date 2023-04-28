import 'package:flutter/material.dart';
import '../widgets/customcarcard.dart';
import '../widgets/customhistory.dart';
import 'homecarona.dart';

class EscolherVeiculo extends StatefulWidget {
  const EscolherVeiculo({super.key});

  @override
  _EscolherVeiculo createState() => _EscolherVeiculo();
}

class _EscolherVeiculo extends State<EscolherVeiculo> {
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
                  'Oferecer Carona',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding:
                      EdgeInsets.only(left: 40.0, right: 40.0, bottom: 32.0),
                  child: Text(
                    'Escolha o veículo',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 32.0),
              child: CarWidget(
                model: 'Hyundai HB20',
                plate: 'BRA1234',
                color: Colors.blueGrey,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeCarona()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //ICONE CARONA
                    Container(
                      margin: const EdgeInsets.only(right: 24.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.add),
                    ),
                    //TEXTOS
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Novo veículo',
                              style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            'Adicionar',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Color.fromRGBO(177, 176, 180, 0.612),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SETA
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.chevron_right, size: 40),
                        ],
                      ),
                    ),
                    //FIM SETA
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
