import 'package:caronapp/const.dart';
import 'package:caronapp/screens/homecarona.dart';
import 'package:caronapp/screens/login.dart';
import 'package:caronapp/screens/termoscondicoes.dart';
import 'package:caronapp/widgets/customdropdown.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:caronapp/widgets/custombutton.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, bottom: 40.0),
              child: GestureDetector(
                child: const Icon(Icons.arrow_back, size: 24),
                onTap: () => {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Login()))
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                'Criar nova conta',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const CustomTextField(
              labelTextCustom: 'Nome',
              keyboardTypeCustom: TextInputType.text,
              backgroundColorCustom: Colors.white,
            ),
            const CustomTextField(
              labelTextCustom: 'Celular (00 00000-0000)',
              keyboardTypeCustom: TextInputType.phone,
              backgroundColorCustom: Colors.white,
            ),
            const CustomTextField(
              labelTextCustom: 'Matrícula',
              keyboardTypeCustom: TextInputType.number,
              backgroundColorCustom: Colors.white,
            ),
            const CustomTextField(
              labelTextCustom: 'E-mail',
              keyboardTypeCustom: TextInputType.emailAddress,
              backgroundColorCustom: Colors.white,
            ),
            CustomDropdown(
              optionsList: const ['Feminino', 'Masculino', 'Não-binário'],
              hint: 'Gênero',
              boxColor: Colors.white,
            ),
            const CustomTextField(
              labelTextCustom: 'Senha',
              keyboardTypeCustom: TextInputType.text,
              backgroundColorCustom: Colors.white,
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, bottom: 8.0),
                child: Row(children: [
                  CheckboxWidget(),
                  const Text('Eu concordo com os'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermosCondicoes()));
                    },
                    child: const Text(
                      'Termos e Condições',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CustomButton(
                text: 'Cadastrar',
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeCarona()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xFF1AD5AD);
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
