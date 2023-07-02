import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custombutton.dart';
import '../widgets/formtextfield.dart';
import '../widgets/roundprofilepicture.dart';
import '../store/user_store.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  _PerfilUsuario createState() => _PerfilUsuario();
}

class _PerfilUsuario extends State<PerfilUsuario> {
  final _form = GlobalKey<FormState>();
  final _celularController = TextEditingController();
  final _senhaController = TextEditingController();

  String _errorLogin = '';
  String? name;

  @override
  void initState() {
    super.initState();
    pegarNomeUser();
  }

  UserStore userTeste = UserStore();

  String? _validateCelular(String? value) {
    if (value == null || value.isEmpty) {
      return "O número de celular é obrigatório";
    }
    if (value.length != 11) {
      return "O número de celular deve ter exatamente 11 números";
    }
    return null;
  }

  String? _validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha é obrigatória";
    }
    if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracters";
    }
    return null;
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() => _errorLogin = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      userStore.setCelular(_celularController.text);
      userStore.setSenha(_senhaController.text);

      Navigator.pushReplacementNamed(context, '/');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Perfil alterado'),
            content: const Text('Seu perifl foi alterado com sucesso.'),
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

  pegarNomeUser() async {
    UserService userService = UserService();

    var userData = await userService.getUserData();
    setState(() {
      name = userData!.displayName!;
    });
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
              FormTextField(
                  controller: _celularController,
                  validator: _validateCelular,
                  keyboardType: TextInputType.phone,
                  labelText: 'Celular'),
              FormTextField(
                  controller: _senhaController,
                  validator: _validateSenha,
                  keyboardType: TextInputType.text,
                  labelText: 'Senha'),
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
          ),
        ),
      ),
    );
  }
}
