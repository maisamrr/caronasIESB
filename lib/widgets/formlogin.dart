import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/widgets/newtextformfield.dart';
import 'package:flutter/material.dart';
import 'custombutton.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String _errorLogin = '';

  bool _obscurePassword = true;
  String? _errorText;

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
    String? errorPassword = _validatePassword(senha);

    if (errorPassword != null) {
      setState(() {
        _errorText = errorPassword;
      });
      return;
    }

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
            title: const Text('Erro de Autenticação'),
            content:
                const Text('Erro ao fazer login. Verifique suas credenciais.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: NewTextFormField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                errorTextColor: const Color.fromARGB(255, 113, 7, 7),
                hintText: 'E-mail'),
          ),
          //SENHA
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    controller: _senhaController,
                    keyboardType: TextInputType.text,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Senha',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                    ),),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                if (_errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      _errorText!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 113, 7, 7),
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          //FIM SENHA
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
            padding: const EdgeInsets.only(top: 16.0, left: 40.0, bottom: 40.0),
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


/*
Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
            child: Container(
              height: 64,
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
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Senha',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ), */