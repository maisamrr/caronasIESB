import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/custombutton.dart';
import 'package:provider/provider.dart';

import '../store/user_store.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({Key? key}) : super(key: key);

  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  void _submitForm(BuildContext context) {
    if (!_form.currentState!.validate()) {
      return;
    }
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    String email = _emailController.text;

    UserService userService = UserService();

    userService.isEmailRegistered(email).then((isRegistered) {
      if (isRegistered) {
        userService.resetPassword(email).then((_) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Redefinição de Senha Enviada'),
                content: Text(
                    'Foi enviado um e-mail para $email com instruções para redefinir a senha.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Email não registrado'),
              content: Text('O email $email não está registrado no sistema.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redIdColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _form,
              child: Consumer<UserStore>(
                builder: (context, userStore, _) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/vemjunto.png',
                              width: 280,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40.0),
                        const Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextFormField(
                                controller: _emailController,
                                validator: _validateEmail,
                                onChanged: (text) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'E-mail',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        CustomButton(
                          text: 'Recuperar',
                          onPressed: () {
                            _submitForm(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
