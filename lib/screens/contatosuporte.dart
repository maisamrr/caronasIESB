import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/services/user_service.dart';
import 'package:caronapp/widgets/formtextfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custombutton.dart';
import '../store/user_store.dart';

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

  String _errorLogin = '';

  bool agree = false;

  UserStore userTeste = UserStore();

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

      UserService userService = UserService();

      if (userService.isEmailRegistered(userStore.email) == false) {
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
      }

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Envio mal-sucedido'),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 40.0,
                ),
                child: GestureDetector(
                  child: const Icon(Icons.arrow_back, size: 24),
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Atividades()))
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
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
                labelText: 'Nome'
              ),
              FormTextField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                labelText: 'E-mail'
              ),
              FormTextField(
                controller: _matriculaController,
                validator: _validateMatricula,
                keyboardType: TextInputType.number,
                labelText: 'Matrícula'
              ),
              /*CustomDropdown(
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
                ),*/
              
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: TextField(
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
                    onChanged: (value) {},
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
    );
  }
}

/*
class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(title: Text('This is tile number 1')),
          ],
        ),
        ExpansionTile(
          title: const Text('ExpansionTile 2'),
          subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children: const <Widget>[
            ListTile(title: Text('This is tile number 2')),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
            });
          },
        ),
        const ExpansionTile(
          title: Text('ExpansionTile 3'),
          subtitle: Text('Leading expansion arrow icon'),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(title: Text('This is tile number 3')),
          ],
        ),
      ],
    );
  }
}
*/