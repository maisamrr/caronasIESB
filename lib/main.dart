import 'package:caronapp/screens/aguardandoinicio.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/destino.dart';
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
        fontFamily: 'Inria',
      ),
      routes: {
        '/oferecercarona': (context) => OferecerCarona(),
        '/pedircarona': (context) => HomeCarona(),
        '/usuarioperfil': (context) => Atividades(),
        '/destino': (context) => Destino()
      },
      home: Builder(
        builder: (context) {
          return AguardandoInicio();
        },
      ),
    );
  }
}
