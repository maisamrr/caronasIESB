import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:caronapp/widgets/custombutton.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redIdColor,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 80, left: 40.0, right: 40.0, bottom: 80.0),
                        child: Image.asset(
                          'assets/images/vemjunto.png',
                          width: 280,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextField(
                            labelTextCustom: 'E-mail',
                            keyboardTypeCustom: TextInputType.emailAddress,
                            backgroundColorCustom: Colors.white,
                          ),
                          const CustomTextField(
                            labelTextCustom: 'Senha',
                            keyboardTypeCustom: TextInputType.text,
                            backgroundColorCustom: Colors.white,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, left: 40.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/esquecisenha');
                              },
                              style: ElevatedButton.styleFrom(),
                              child: const Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: CustomButton(
                              text: 'Login',
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/pedircarona');
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, left: 40.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/cadastrousuario');
                              },
                              style: ElevatedButton.styleFrom(),
                              child: const Text(
                                'Não tem uma conta? Inscreva-se',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}