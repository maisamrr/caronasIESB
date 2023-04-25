import 'package:caronapp/screens/destino.dart';
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
      home: Builder(
        builder: (context) {
          return const Destino();
        },
      ),
    );
  }
}
