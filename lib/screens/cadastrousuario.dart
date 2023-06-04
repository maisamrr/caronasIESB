import 'package:caronapp/const.dart';
import 'package:caronapp/widgets/customdropdown.dart';
import 'package:caronapp/widgets/formtextfield.dart';
import 'package:flutter/material.dart';
import 'package:caronapp/widgets/custombutton.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _emailController = TextEditingController();
  final _dropdownController = TextEditingController();
  final _passwordController = TextEditingController();

  bool agree = false;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome é obrigatório";
    }
    if (value.length < 3) {
      return "O nome deve ter no mínimo 3 caracteres";
    }
    return null;
  }

  String? _validatePhone(String? value) {
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

  @override
  void dispose() {
    _dropdownController.dispose();
    super.dispose();
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

  void _onAgreeChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        agree = newValue;
      });
    }
  }

  void _submitForm(BuildContext context) {
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
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0, bottom: 40.0),
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
              FormTextField(
                  controller: _nameController,
                  validator: _validateName,
                  keyboardType: TextInputType.text,
                  labelText: 'Nome'),
              FormTextField(
                  controller: _phoneController,
                  validator: _validatePhone,
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
              //consertar controller
              CustomDropdown(
                optionsList: const [
                  'Feminino',
                  'Masculino',
                  'Não-binário',
                  'Prefiro não informar'
                ],
                hint: 'Gênero',
                boxColor: Colors.white,
                dropdownController: _dropdownController,
              ),
              FormTextField(
                  controller: _passwordController,
                  validator: _validatePassword,
                  keyboardType: TextInputType.text,
                  labelText: 'Senha'),
              Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 40.0, bottom: 8.0),
                  child: Row(children: [
                    Checkbox(
                      value: agree,
                      onChanged: _onAgreeChanged,
                    ),
                    const Text('Eu concordo com os'),
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
                  ])),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: CustomButton(
                  text: 'Cadastrar',
                  onPressed: () => _submitForm(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
