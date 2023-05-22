import 'package:caronapp/screens/cadastro.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

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
                        MaterialPageRoute(builder: (context) => Cadastro()))
                  },
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF5757),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: ExpansionTile(
                  title: Text(
                    'Como faço para pedir uma carona?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Na tela inicial, informe seu destino e confira o local de partida. Em seguida, toque em "Confirmar". Espere alguns minutos para ver as informações da sua viagem, você deverá ver os dados da pessoa motorista e os demais passageiros, se for o caso. Depois disso, seu assento será reservado. Acompanhe pelo app quando a carona estiver a caminho do local de partida.',
                        style: TextStyle(
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: ExpansionTile(
                  title: Text(
                    'Qual é o preço de uma viagem?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                      'As viagens no VemJunto são de graça. Não é permitido cobrar por uma viagem através do app.',
                      style: TextStyle(
                        height: 1.8,
                      ),
                    )),
                  ],
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
