import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/cadastro.dart';
import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/destino.dart';
import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/screens/excluirveiculo.dart';
import 'package:caronapp/screens/faq.dart';
import 'package:caronapp/screens/historicodaviagem.dart';
import 'package:caronapp/screens/historicodecaronas.dart';
import 'package:caronapp/screens/homecarona.dart';
import 'package:caronapp/screens/login.dart';
import 'package:caronapp/screens/oferecercarona.dart';
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
      routes: {
        '/oferecercarona': (context) => OferecerCarona(),
        '/pedircarona': (context) => HomeCarona(),
        '/usuarioperfil': (context) => Atividades(),
        '/destino': (context) => Destino()
      },
      home: Builder(
        builder: (context) {
          return Login();
        },
      ),
    );
  }
}