import 'package:caronapp/const.dart';
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
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: redIdColor,
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
                                    builder: (context) => const Atividades()))
                          },
                        ),
                      ),
                    ),
                    //FOTO INICIO
                    GestureDetector(
                      child: Stack(
                        children: [
                          const RoundProfilePicture(
                            photoPath: 'assets/images/imgprofilejulia.png',
                            circleSize: 120,
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
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Alterar perfil',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomTextField(
                labelTextCustom: 'Celular',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: 'Matrícula',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: 'Email',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: '********',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Colors.white,
              ),
              const CustomTextField(
                labelTextCustom: 'Curso',
                keyboardTypeCustom: TextInputType.phone,
                backgroundColorCustom: Colors.white,
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
                              builder: (context) => const Atividades()));
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
