import 'package:caronapp/screens/oferecercarona.dart';
import 'package:flutter/material.dart';

class CarWidget extends StatefulWidget {
  final String model;
  final String plate;
  final Color color;

  CarWidget({required this.model, required this.plate, required this.color});

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  late Color _iconColor;

  @override
  void initState() {
    super.initState();
    _iconColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OferecerCarona()))
      },
      child: Container(
        padding: const EdgeInsets.only(
            top: 24.0, left: 16.0, right: 16, bottom: 24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 236, 236, 236),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 38, 63, 51),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 28, 22, 46)),
                ),
                Text(
                  widget.plate,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color.fromARGB(255, 28, 22, 46)),
                ),
              ],
            ),
            Icon(
              Icons.directions_car,
              color: _iconColor,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
