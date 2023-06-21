import 'package:caronapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/user_store.dart';
import 'custombutton.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String _errorLogin = '';

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
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

    String email = _emailController.text;
    String senha = _senhaController.text;

    UserService userService = UserService();

    try {
      await userService.loginUser(email: email, senha: senha);
      // O login foi realizado com sucesso, faça a navegação para a próxima tela
      Navigator.of(context).pushReplacementNamed('/pedircarona');
    } catch (e) {
      // Trate o erro de autenticação aqui
      setState(() {
        _errorLogin = 'Erro ao fazer login. Verifique suas credenciais.';
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Autenticação'),
            content: Text('Erro ao fazer login. Verifique suas credenciais.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
            child: Container(
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
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'E-mail',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
            child: Container(
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
                    controller: _senhaController,
                    validator: _validatePassword,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Senha',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/esquecisenha');
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
              onPressed: () => _submitForm(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0),
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
    );
  }
}
