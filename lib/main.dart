import 'package:caronapp/screens/destino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Builder(
        builder: (context) {
          return DefaultTextStyle(
            style: GoogleFonts.inriaSans(
              textStyle: Theme.of(context).textTheme.headlineMedium,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            child: const Destino(),
          );
        },
      ),
    );
  }
}