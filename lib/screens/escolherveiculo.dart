import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';

import '../store/car_model.dart';
import '../store/marcas_model.dart';
import '../widgets/carmodeltile.dart';

import 'package:caronapp/store/car_store.dart';
import 'package:provider/provider.dart';

class EscolherVeiculo extends StatefulWidget {
  const EscolherVeiculo({Key? key}) : super(key: key);

  @override
  _EscolherVeiculo createState() => _EscolherVeiculo();
}

class _EscolherVeiculo extends State<EscolherVeiculo> {
  final _form = GlobalKey<FormState>();
  TextEditingController? selectedPlaca;
  Marca? selectedMarca;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      setState(() {
        selectedPlaca = arguments['selectedPlaca'] as TextEditingController?;
        selectedMarca = arguments['selectedMarca'] as Marca?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CarStore carStore = Provider.of<CarStore>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                ),
                child: GestureDetector(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.grey,
                  ),
                  onTap: () => {
                    Navigator.of(context)
                        .pushReplacementNamed('/oferecercarona'),
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Escolher Veículo',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 24.0),
                child: Text(
                  'Escolha o veículo desejado',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 16.0),
                child: GestureDetector(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf7f5f5),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Adicionar novo',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/cadastroveiculo',
                      arguments: {
                        'selectedPlaca': selectedPlaca,
                        'selectedMarca': selectedMarca,
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: carStore.carros.length,
                  itemBuilder: (context, index) {
                    Car carro = carStore.carros[index];
                    return CarModelTile(
                      carro: carro,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
