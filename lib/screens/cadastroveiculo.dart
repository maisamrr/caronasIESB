import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/bottomnavigationbarwidget.dart';
import '../widgets/custombutton.dart';
import '../widgets/carwidget.dart';
import '../widgets/customdropdown.dart';
import '../widgets/customhistory.dart';
import 'homecarona.dart';

class CadastroVeiculo extends StatefulWidget {
  const CadastroVeiculo({super.key});

  @override
  _CadastroVeiculo createState() => _CadastroVeiculo();
}

class _CadastroVeiculo extends State<CadastroVeiculo> {
  @override
  Widget build(BuildContext context) {
    //STATUS BAR
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    //FIM STATUS BAR

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
                  'Cadastrar veículo',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //PLACA
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: CustomTextField(
                    labelTextCustom: 'Placa',
                    keyboardTypeCustom: TextInputType.text,
                    backgroundColorCustom: Color(0xFFEDEDED),
                  ),
                ),
                //MODELO
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, bottom: 24.0),
                  child: CustomDropdown(
                    optionsList: const ['Ford Ka', 'HB20', 'Celta'],
                    hint: 'Modelo',
                  ),
                ),
                //COR
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, bottom: 24.0),
                  child: CustomDropdown(
                    optionsList: const [
                      'Prata',
                      'Branco',
                      'Vermelho',
                      'Preto',
                      'Azul escuro'
                    ],
                    hint: 'Cor',
                  ),
                ),
                //COR
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, bottom: 24.0),
                  child: CustomDropdown(
                    optionsList: const ['Carro', 'Moto'],
                    hint: 'Tipo',
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 24.0),
              child: CustomButton(
                text: 'Cadastrar',
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EscolherVeiculo()));
                },
              ),
            ),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
