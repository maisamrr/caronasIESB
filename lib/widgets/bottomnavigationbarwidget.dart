import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {
      'icon': 'assets/images/tabler_steering-wheel.svg',
      'width': 45.0,
      'height': 45.0,
      'route': '/oferecercarona',
    },
    {
      'icon': 'assets/images/solar_user-hand-up-broken.svg',
      'width': 39.0,
      'height': 43.17,
      'route': '/pedircarona',
    },
    {
      'icon': 'assets/images/ep_menu.svg',
      'width': 37.5,
      'height': 37.5,
      'route': '/usuarioperfil',
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
    const double iconPadding = 20.0; // define o valor do padding

    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(fontSize: 8),
      unselectedLabelStyle: TextStyle(fontSize: 8),
      backgroundColor: const Color(0xFFFF5757),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: _items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(
                    _items.indexOf(item) == 0 ? iconPadding : 0,
                    10,
                    _items.indexOf(item) == _items.length - 1
                        ? iconPadding
                        : 0,
                    0),
                child: SvgPicture.asset(
                  item['icon'],
                  width: item['width'],
                  height: item['height'],
                ),
              ),
              label: '',
            ),
          )
          .toList(),
    );
  }
}