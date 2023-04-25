import 'package:flutter/material.dart';
import 'package:caronapp/widgets/customtextfield.dart';
import 'package:caronapp/widgets/custombutton.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5757),
      body: Center(
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
                      ),
                      const CustomTextField(
                        labelTextCustom: 'Senha',
                        keyboardTypeCustom: TextInputType.text,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                        child: TextButton(
                          onPressed: () {},
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
                      CustomButton(
                        text: 'Login',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 40.0),
                        child: TextButton(
                          onPressed: () {},
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
    );
  }
}
