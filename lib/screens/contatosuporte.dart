import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/widgets/formtextfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custombutton.dart';
import '../store/user_store.dart';
import '../widgets/customdropdown.dart';

class ContatoSuporte extends StatefulWidget {
  const ContatoSuporte({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContatoSuporteState createState() => _ContatoSuporteState();
}

class _ContatoSuporteState extends State<ContatoSuporte> {
  final _form = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _emailController = TextEditingController();
  final _dropdownController = TextEditingController();
  final _mensagemController = TextEditingController();

  String _errorLogin = '';

  String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return "O nome é obrigatório";
    }
    if (value.length < 3) {
      return "O nome deve ter no mínimo 3 caracteres";
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

  String? _validateMensagem(String? value) {
    if (value == null || value.isEmpty) {
      return "A mensagem é obrigatória";
    }
    if (value.length < 50) {
      return "A mensagem deve mais de 50 caracteres";
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
      userStore.setNome(_nomeController.text);
      userStore.setMatricula(_matriculaController.text);
      userStore.setEmail(_emailController.text);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Envio bem-sucedido'),
            content: const Text('Sua mensagem foi enviada com sucesso.'),
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
        child: Form(
          key: _form,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_errorLogin.isNotEmpty)
                  Text(
                    _errorLogin,
                    style: TextStyle(color: Colors.red),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 40.0,
                  ),
                  child: GestureDetector(
                    child: const Icon(Icons.arrow_back, size: 24),
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Atividades()))
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      'Suporte',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        color: redIdColor,
                      ),
                    ),
                  ),
                ),
                FormTextField(
                    controller: _nomeController,
                    validator: _validateNome,
                    keyboardType: TextInputType.text,
                    labelText: 'Nome'),
                FormTextField(
                    controller: _emailController,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'E-mail'),
                FormTextField(
                    controller: _matriculaController,
                    validator: _validateMatricula,
                    keyboardType: TextInputType.number,
                    labelText: 'Matrícula'),
                CustomDropdown(
                  optionsList: const [
                    'Login',
                    'Pedir carona',
                    'Oferecer carona',
                    'Veículo',
                    'Perfil',
                    'Outros'
                  ],
                  hint: 'Tipo de problema',
                  boxColor: Colors.white,
                  dropdownController: _dropdownController,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        labelText: 'Descrição do problema',
                        hintText: 'Relate aqui seu problema',
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                      ),
                      maxLines: 20,
                      keyboardType: TextInputType.multiline,
                      controller: _mensagemController,
                      validator: _validateMensagem,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 40.0, right: 40.0),
                  child: CustomButton(
                    text: 'Enviar',
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
