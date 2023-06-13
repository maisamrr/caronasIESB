import 'package:caronapp/const.dart';
import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/car_store.dart';
import 'package:caronapp/store/marcas_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/clearabletextfield.dart';
import '../widgets/custombutton.dart';

class CadastroVeiculo extends StatefulWidget {
  const CadastroVeiculo({super.key});

  @override
  _CadastroVeiculo createState() => _CadastroVeiculo();
}

class _CadastroVeiculo extends State<CadastroVeiculo> {
  final _form = GlobalKey<FormState>();
  final _placaController = TextEditingController();
  Marca? marcaSelecionada;

  String? validatePlaca(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe uma placa';
    }
    if (value.length != 7) {
      return 'A placa deve ter 8 caracteres';
    }
    return null;
  }

  String? validateMarca(Marca? value) {
    if (value == null) {
      return 'Selecione um modelo de carro';
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    Car carro = Car(placa: _placaController.text, marca: marcaSelecionada!);
    CarStore carStore = Provider.of<CarStore>(context, listen: false);
    carStore.addCar(carro);

    Navigator.pushNamed(
      context,
      '/escolherveiculo',
      arguments: {
        'selectedPlaca': _placaController,
        'selectedMarca': marcaSelecionada,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).pushNamed('/escolherveiculo'),
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Cadastrar novo veículo',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: redIdColor,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //PLACA
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClearableTextField(
                                  controller: _placaController,
                                  validator: validatePlaca,
                                  labelText: 'Placa',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // MENU DROPDOWN - Modelos de Carros
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 0),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonFormField<Marca?>(
                            value: marcaSelecionada,
                            validator: validateMarca,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            icon: const Icon(Icons.expand_more_outlined),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18.0),
                            onChanged: (Marca? newValue) {
                              setState(() {
                                marcaSelecionada = newValue;
                              });
                            },
                            items: [
                              DropdownMenuItem<Marca?>(
                                value: null,
                                child: Text(
                                  'Modelo',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              ...Marca.values.map((Marca marca) {
                                return DropdownMenuItem<Marca?>(
                                  value: marca,
                                  child: Text(marca.formattedString),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //FIM dropdown
                ],
              ),
              //BOTAO
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 24.0),
                child: CustomButton(
                  text: 'Cadastrar',
                  onPressed: () => _submitForm(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
