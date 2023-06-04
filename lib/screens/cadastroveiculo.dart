import 'package:caronapp/const.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custombutton.dart';
import '../widgets/customdropdown.dart';

class CadastroVeiculo extends StatefulWidget {
  const CadastroVeiculo({super.key});

  @override
  _CadastroVeiculo createState() => _CadastroVeiculo();
}

class _CadastroVeiculo extends State<CadastroVeiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
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
                child: const Icon(Icons.arrow_back, size: 24, color: Colors.grey,),
                onTap: () => {
                  Navigator.of(context).pushNamed('/escolherveiculo'),
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Cadastrar veículo',
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
                CustomTextField(
                  labelTextCustom: 'Placa',
                  keyboardTypeCustom: TextInputType.text,
                  backgroundColorCustom: Colors.white,
                ),/*
                CustomDropdown(
                  optionsList: const ['Ford Ka', 'HB20', 'Celta'],
                  hint: 'Modelo',
                  boxColor: Colors.white,
                ),
                CustomDropdown(
                  optionsList: const [
                    'Prata',
                    'Branco',
                    'Vermelho',
                    'Preto',
                    'Azul escuro'
                  ],
                  hint: 'Cor',
                  boxColor: Colors.white,
                ),
                CustomDropdown(
                  optionsList: const ['Carro', 'Moto'],
                  hint: 'Tipo',
                  boxColor: Colors.white,
                ),*/
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 24.0),
              child: CustomButton(
                text: 'Cadastrar',
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EscolherVeiculo()));
                },
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
