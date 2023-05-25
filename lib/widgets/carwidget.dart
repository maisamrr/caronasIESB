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
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
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
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.plate,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                  ),
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
