import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/customcarcard.dart';
import '../widgets/customhistory.dart';
import 'excluirveiculo.dart';
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
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 32.0),
              child: CarWidget(
                model: 'Hyundai HB20',
                plate: 'BRA1234',
                color: Colors.blueGrey,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadastroVeiculo()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: CustomHistory(
                  title: 'Novo veículo',
                  subtitle: 'Adicionar',
                  iconAsset: Icons.add,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExcluirVeiculo()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: CustomHistory(
                  title: 'Excluir veículo',
                  subtitle: 'Remover',
                  iconAsset: Icon(Icons.delete_outline, size: 20, color: Colors.black),
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
