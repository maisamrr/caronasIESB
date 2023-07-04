import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  const BottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.hail_outlined,
      'label': 'Pedir carona',
      'route': '/pedircarona',
    },
    {
      'icon': Icons.directions_car_outlined,
      'label': 'Oferecer carona',
      'route': '/oferecercarona',
    },
    {
      'icon': Icons.grid_view_outlined,
      'label': 'Atividade',
      'route': '/atividades',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushNamed(context, _items[_selectedIndex]['route']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
        color: Colors.grey,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 4,
        activeColor: redIdColor,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: redIdColor),
        tabs: _items
            .map(
              (item) => GButton(
                icon: item['icon'],
                text: item['label'],
              ),
            )
            .toList(),
      ),
    );
  }
}
