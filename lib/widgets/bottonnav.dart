import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey,
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: redIdColor,
          //tabBackgroundColor: const Color(0xFFF2F1F0),
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            GButton(
              icon: Icons.hail_outlined,
              iconSize: 30,
              text: 'Pedir carona',
              textStyle: TextStyle(fontSize: 16.0, color: redIdColor),
            ),
            GButton(
              icon: Icons.directions_car_outlined,
              iconSize: 30,
              text: 'Oferecer carona',
              textStyle: TextStyle(fontSize: 16.0, color: redIdColor),
            ),
            GButton(
              icon: Icons.grid_view_outlined,
              iconSize: 30,
              text: 'Atividade',
              textStyle: TextStyle(fontSize: 16.0, color: redIdColor),
            ),
          ]),
    );
  }
}
