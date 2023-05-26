import 'package:caronapp/screens/aguardandoinicio.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/cadastrousuario.dart';
import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/destino.dart';
import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/screens/esquecisenha.dart';
import 'package:caronapp/screens/faq.dart';
import 'package:caronapp/screens/fimcarona.dart';
import 'package:caronapp/screens/detalhesdaviagem.dart';
import 'package:caronapp/screens/historicodecaronas.dart';
import 'package:caronapp/screens/login.dart';
import 'package:caronapp/screens/oferecercarona.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:caronapp/screens/pedircarona.dart';
import 'package:caronapp/screens/termoscondicoes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VemJunto',
      theme: ThemeData(
        fontFamily: 'Satochi',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/esquecisenha': (context) => EsqueciSenha(),
        '/cadastrousuario': (context) => CadastroUsuario(),
        '/termosecondicoes': (context) => TermosCondicoes(),
        '/pedircarona': (context) => PedirCarona(),


        '/destino': (context) => Destino(),
        '/detalhescarona': (context) => DetalhesCarona(),
        '/aguardandoinicio':(context) => AguardandoInicio(),
        '/fimcarona': (context) => FimCarona(),
        '/oferecercarona':(context) => OferecerCarona(),
        'escolherveiculo':(context) => EscolherVeiculo(),
        '/cadastroveiculo':(context) => CadastroVeiculo(),

        '/atividades':(context) => Atividades(),
        '/perfilusuario':(context) => PerfilUsuario(),
        '/contatosuporte':(context) => ContatoSuporte(),
        '/faq':(context) => Faq(),
        '/historicocaronas':(context) => HistoricoDeCaronas(),
        '/detalhesviagem':(context) => DetalhesDaViagem(),

      },
      
    );
  }
}
