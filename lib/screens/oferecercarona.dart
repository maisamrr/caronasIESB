import 'package:caronapp/const.dart';
import 'package:caronapp/services/viagem_service.dart';
import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:flutter/material.dart';
import '../store/marcas_model.dart';
import '../widgets/bottonnav.dart';
import '../widgets/carwidget.dart';
import '../widgets/custombutton.dart';
import '../widgets/customsearchfield.dart';
import '../widgets/kmformfield.dart';
import '../widgets/newtextformfield.dart';

class OferecerCarona extends StatefulWidget {
  const OferecerCarona({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OferecerCaronaState createState() => _OferecerCaronaState();
}

class _OferecerCaronaState extends State<OferecerCarona> {
  final _form = GlobalKey<FormState>();
  final _partidaController = TextEditingController();
  final _destinoController = TextEditingController();

  Car? selectedCar;
  int _km = 0;
  TimeOfDay? _selectedTime;

  String? _validateEndereco(String? value) {
    if (value == null || value.isEmpty) {
      return "O endereço é obrigatório";
    }
    if (value.length < 8) {
      return "O endereço deve ter no mínimo 8 caracteres";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    String? tripId;
    if (!_form.currentState!.validate()) {
      return;
    }

    if (selectedCar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('É obrigatória a seleção de um veículo.'),
        ),
      );
      return;
    }

    try {
      ViagemService viagemService = ViagemService();

      tripId = await viagemService.saveTrip(
          data:
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          horario: "${DateTime.now().hour}:${DateTime.now().minute}",
          partida: _partidaController.text,
          chegada: _destinoController.text,
          carro: selectedCar,
          status: StatusViagem.naoIniciada);

      Navigator.pushReplacementNamed(context, '/aguardandoinicio',
          arguments: tripId);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obter o argumento passado da terceira tela
    final arguments = ModalRoute.of(context)!.settings.arguments;

// // Verificar se os argumentos são válidos
    if (arguments != null && arguments is Map<String, dynamic>) {
      final selectedPlaca = arguments['selectedPlaca'] as String?;
      final selectedMarca = arguments['selectedMarca'] as Marca?;
      if (selectedPlaca != null && selectedMarca != null) {
        selectedCar = Car(
          placa: selectedPlaca,
          marca: selectedMarca,
        );
      }
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Center(
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
                        fontWeight: FontWeight.w900,
                        color: redIdColor,
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text('Carro em uso',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                //botao - adicione um carro
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 0, 0),
                  child: SizedBox(
                    height: 60,
                    width: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (selectedCar != null)
                          Expanded(
                            child: CarWidget(
                              marca: selectedCar!.marca.formattedString,
                              placa: selectedCar!.placa,
                              color: redIdColor,
                              modelFontSize: 14,
                              plateFontSize: 12,
                              iconSize: 24,
                            ),
                          ),
                        if (selectedCar == null)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, "/escolherveiculo"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adicione um carro',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(35, 0, 10, 0),
                                    child: Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                //partida
                NewTextFormField(
                  hintText: 'Local de partida',
                  controller: _partidaController,
                  validator: _validateEndereco,
                  keyboardType: TextInputType.text,
                  errorTextColor: redIdColor,
                  maxLength: 20, 
                ),
                NewTextFormField(
                  hintText: 'Destino final',
                  controller: _destinoController,
                  validator: _validateEndereco,
                  keyboardType: TextInputType.text,
                  errorTextColor: redIdColor,
                  maxLength: 20,
                ),
                KmFormField(
                  context: context,
                  labelText: 'Limite de quilometragem',
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.grey[200]!,
                  onSubmitted: (value) {
                    _km = value as int;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 40, top: 8, bottom: 24.0),
                    child: CustomButton(
                      text: 'VemJunto',
                      onPressed: () => _submitForm(context),
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}
