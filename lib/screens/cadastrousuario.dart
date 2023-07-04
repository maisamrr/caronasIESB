import 'package:caronapp/const.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/widgets/formtextfield.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/custombutton.dart';
import 'package:provider/provider.dart';
import '../store/user_store.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _form = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _celularController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String _errorLogin = '';

  bool agree = false;

  UserStore userTeste = UserStore();

  bool _obscurePassword = true;

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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "E-mail é obrigatório";
    }
    if (!value.contains('@')) {
      return "E-mail inválido";
    }
    return null;
  }

  String? _validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha é obrigatória";
    }
    if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracters";
    }
    return null;
  }

  void _onAgreeChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        agree = newValue;
      });
    }
  }

  Future<void> _submitForm(BuildContext context) async {
    if (!_form.currentState!.validate()) {
      return;
    }

    if (!agree) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Termos e Condições'),
            content: const Text(
                'Para prosseguir, você deve concordar com os Termos e Condições.'),
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
      return;
    }

    setState(() => _errorLogin = '');

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      userStore.setNome(_nomeController.text);
      userStore.setCelular(_celularController.text);
      userStore.setMatricula(_matriculaController.text);
      userStore.setEmail(_emailController.text);
      userStore.setSenha(_senhaController.text);

      UserService userService = UserService();

      bool emailExists = await userService.isEmailRegistered(userStore.email);

      if (emailExists == false) {
        await userService.saveUser(
          nome: userStore.nome,
          celular: userStore.celular,
          matricula: userStore.matricula,
          email: userStore.email,
          senha: userStore.senha,
        );

        Navigator.pushReplacementNamed(context, '/');

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Cadastro bem-sucedido'),
              content: const Text('Seu cadastro foi realizado com sucesso.'),
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
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Cadastro mal-sucedido'),
              content: const Text('Email já cadastrado'),
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
      }
    } catch (e) {
      setState(() => _errorLogin = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25, left: 40.0, bottom: 40.0),
                  child: GestureDetector(
                    child: const Icon(Icons.arrow_back, size: 24),
                    onTap: () => {
                      Navigator.of(context).pushReplacementNamed('/'),
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Criar nova conta',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _errorLogin,
                    style: const TextStyle(
                      height: 2,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                    keyboardType: TextInputType.number,
                    labelText: 'Matrícula'),
                FormTextField(
                    controller: _emailController,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'E-mail'),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
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
                          validator: _validateSenha,
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
                ),
                /*FormTextField(
                  controller: _senhaController,
                  validator: _validateSenha,
                  keyboardType: TextInputType.text,
                  labelText: 'Senha',
                ),*/
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 32.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      Checkbox(
                        value: agree,
                        onChanged: _onAgreeChanged,
                      ),
                      const Text('Aceito os'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/termosecondicoes');
                        },
                        child: const Text(
                          'Termos e Condições',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, bottom: 40.0),
                  child: CustomButton(
                    text: 'Cadastrar',
                    onPressed: () => _submitForm(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
