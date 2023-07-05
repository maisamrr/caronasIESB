import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  const BottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  @override
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
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: redIdColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: _items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        );
      }).toList(),
    );
  }
}
