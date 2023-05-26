import 'package:caronapp/const.dart';
import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:flutter/material.dart';
import '../models/carmodel.dart';
import '../models/savedcarmodels.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/carmodeltile.dart';
import '../widgets/carwidget.dart';
import '../widgets/customhistory.dart';
import 'oferecercarona.dart';

class ExcluirVeiculo extends StatefulWidget {
  const ExcluirVeiculo({super.key});

  @override
  _ExcluirVeiculo createState() => _ExcluirVeiculo();
}

class _ExcluirVeiculo extends State<ExcluirVeiculo> {
  SavedCarModels savedCarModels = SavedCarModels();

  @override
  Widget build(BuildContext context) {
    List<CarModel> cars = savedCarModels.savedCarModels;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Oferecer Carona',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: redIdColor,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 24.0),
              child: Text(
                'Escolha o veículo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 16.0, bottom: 32.0),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: cars.length,
                        itemBuilder: (context, index) {
                          final car = cars[index];
                          return CarModelTile(
                            carModel: car,
                            onPressed: () {},
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 32.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EscolherVeiculo()))
                    },
                    child: Container(
                      padding: const EdgeInsets.all(32.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFFF5757),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(20, 38, 63, 51),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.delete_outline,
                                  size: 25, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 32.0),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EscolherVeiculo()))
                    },
                    child: Container(
                      padding: const EdgeInsets.all(32.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 236, 236, 236),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(20, 38, 63, 51),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.close, size: 25, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
