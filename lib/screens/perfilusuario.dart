import 'package:caronapp/screens/atividades.dart';
import 'package:flutter/material.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';
import '../widgets/roundprofilepicture.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  _PerfilUsuario createState() => _PerfilUsuario();
}

class _PerfilUsuario extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5757),
                ),
                child: Column(
                  children: [
                    //FOTO
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: RoundProfilePicture(
                        photoPath: 'assets/images/imgprofilejulia.png',
                        size: 120,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0, bottom: 32.0),
                      child: Text(
                        'Julia Paiva',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomTextField(
                labelTextCustom: 'Celular (61 99000-0000)',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Color(0xFFEDEDED),
              ),
              const CustomTextField(
                labelTextCustom: 'Matrícula 20201235000',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Color(0xFFEDEDED),
              ),
              const CustomTextField(
                labelTextCustom: 'paiva.julia@iesb.edu.br',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Color(0xFFEDEDED),
              ),
              const CustomTextField(
                labelTextCustom: '********',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Color(0xFFEDEDED),
              ),
              const CustomTextField(
                labelTextCustom: 'Ciência da Computação - 5º',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Color(0xFFEDEDED),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 40.0),
                  child: CustomButton(
                    text: 'Alterar',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Atividades()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
