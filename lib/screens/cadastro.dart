import 'package:flutter/material.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:caronapp/widgets/custombutton.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              labelTextCustom: 'Celular (00 00000-0000)',
              keyboardTypeCustom: TextInputType.phone,
            ),
            const CustomTextField(
              labelTextCustom: 'Matrícula',
              keyboardTypeCustom: TextInputType.number,
            ),
            const CustomTextField(
              labelTextCustom: 'E-mail',
              keyboardTypeCustom: TextInputType.emailAddress,
            ),
            const CustomTextField(
              labelTextCustom: 'Gênero',
              keyboardTypeCustom: TextInputType.emailAddress,
            ),
            const CustomTextField(
              labelTextCustom: 'Senha',
              keyboardTypeCustom: TextInputType.text,
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, bottom: 8.0),
                child: Row(children: const [
                  //Checkbox,
                  Icon(Icons.circle_outlined, size: 12),
                  Text('  Eu concordo com os Termos e Condições.'),
                ])),
            CustomButton(
              text: 'Cadastrar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
