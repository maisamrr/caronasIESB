import 'package:caronapp/const.dart';
import 'package:caronapp/widgets/formlogin.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormLogin(),
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
