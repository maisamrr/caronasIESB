import 'package:caronapp/screens/atividades.dart';
import 'package:flutter/material.dart';

import '../widgets/custombutton.dart';
import '../widgets/customdropdown.dart';
import '../widgets/customtextfield.dart';

class ContatoSuporte extends StatelessWidget {
  const ContatoSuporte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        MaterialPageRoute(builder: (context) => Atividades()))
                  },
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'Suporte',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              const CustomTextField(
                labelTextCustom: 'Nome',
                keyboardTypeCustom: TextInputType.text,
                backgroundColorCustom: Color(0xFFEBEBEB),
              ),
              const CustomTextField(
                labelTextCustom: 'E-mail',
                keyboardTypeCustom: TextInputType.emailAddress,
                backgroundColorCustom: Color(0xFFEBEBEB),
              ),
              const CustomTextField(
                labelTextCustom: 'Matrícula',
                keyboardTypeCustom: TextInputType.number,
                backgroundColorCustom: Color(0xFFEBEBEB),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
                child: CustomDropdown(
                  optionsList: const [
                    'Login',
                    'Pedir carona',
                    'Oferecer carona',
                    'Veículo',
                    'Perfil',
                    'Outros'
                  ],
                  hint: 'Tipo de problema',
                  boxColor: const Color(0xFFEBEBEB),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFFEBEBEB),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0),
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
                  text: 'Recuperar',
                  onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Atividades()))
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
