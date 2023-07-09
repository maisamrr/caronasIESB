import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custombutton.dart';
import '../widgets/formtextfield.dart';
import '../widgets/roundprofilepicture.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({Key? key}) : super(key: key);

  @override
  _PerfilUsuario createState() => _PerfilUsuario();
}

class _PerfilUsuario extends State<PerfilUsuario> {
  final _form = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _celularController = TextEditingController();

  String _errorLogin = '';
  String? name;

  @override
  void initState() {
    super.initState();
    pegarDadosUser();
  }

  pegarDadosUser() async {
    UserService userService = UserService();

    // var userData = await userService.getUserData();
    Map<String, dynamic>? userCustomData =
        await userService.getCurrentUserCustomData();

    var userData = userCustomData?.values.first;

    setState(() {
      name = userData['nome'] ?? '';
      _nomeController.text = userData['nome'] ?? '';
      _celularController.text = userData['celular'] ?? '';
      _matriculaController.text = userData['matricula'] ?? '';
    });
  }

  String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome é obrigatório";
    }
    if (value.length < 3) {
      return "O nome deve ter no mínimo 3 caracteres";
    }
    return null;
  }

  String? _validateCelular(String? value) {
    if (value == null || value.isEmpty) {
      return "O número de celular é obrigatório";
    }
    if (value.length != 11) {
      return "O número de celular deve ter exatamente 11 números";
    }
    return null;
  }

  String? _validateMatricula(String? value) {
    if (value == null || value.isEmpty) {
      return "A matrícula é obrigatória";
    }
    if (value.length != 10) {
      return "A matrícula deve ter exatamente 10 números";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }
    setState(() => _errorLogin = '');

    try {
      UserService userService = UserService();

      userService.updateUser(_nomeController.text, _celularController.text,
          _matriculaController.text);

      Navigator.pushReplacementNamed(context, '/');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Perfil alterado'),
            content: const Text('Seu perfil foi alterado com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      setState(() => _errorLogin = e.toString());
    }
  }

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
                            photoPath: 'assets/images/imgdefaultuser.png',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 32.0),
                      child: Text(
                        name ?? '',
                        style: const TextStyle(
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
              Text(
                _errorLogin,
                style: const TextStyle(
                  height: 2,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                  key: _form,
                  child: Column(
                    children: [
                      FormTextField(
                          controller: _nomeController,
                          validator: _validateNome,
                          keyboardType: TextInputType.text,
                          labelText: 'Nome'),
                      FormTextField(
                          controller: _celularController,
                          validator: _validateCelular,
                          keyboardType: TextInputType.phone,
                          labelText: 'Celular'),
                      FormTextField(
                          controller: _matriculaController,
                          validator: _validateMatricula,
                          keyboardType: TextInputType.text,
                          labelText: 'Matricula'),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 40.0),
                          child: CustomButton(
                            text: 'Alterar',
                            onPressed: () => _submitForm(context),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
