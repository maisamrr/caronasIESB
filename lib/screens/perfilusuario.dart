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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Colors.white,
                          ),
                          onTap: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Atividades()))
                          },
                        ),
                      ),
                    ),
                    //FOTO INICIO
                    GestureDetector(
                      child: Stack(
                        children: [
                          RoundProfilePicture(
                            photoPath: 'assets/images/imgprofilejulia.png',
                            size: 120,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => {},
                    ),
                    //FOTO FIM
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
