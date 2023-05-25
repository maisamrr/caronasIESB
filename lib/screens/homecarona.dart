import 'package:caronapp/const.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/oferecercarona.dart';
import 'package:caronapp/screens/solicitarcarona.dart';
import 'package:caronapp/widgets/bottonnav.dart';
import 'package:flutter/material.dart';

import 'faq.dart';

class HomeCarona extends StatefulWidget {
  const HomeCarona({super.key});
  @override
  State<HomeCarona> createState() => _HomeCaronaState();
}

class _HomeCaronaState extends State<HomeCarona> {
  //NAV BOTTOM BAR
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //SCREENS
  final List<Widget> _screens = [
    PedirCarona(),
    OferecerCarona(),
    Atividades(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _screens[_selectedIndex], 
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}


