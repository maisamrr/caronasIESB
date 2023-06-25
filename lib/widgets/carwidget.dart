import 'package:caronapp/screens/oferecercarona.dart';
import 'package:flutter/material.dart';

class CarWidget extends StatefulWidget {
  final String marca;
  final String placa;
  final Color color;
  final double modelFontSize;
  final double plateFontSize;
  final double iconSize;

  const CarWidget(
      {super.key,
      required this.marca,
      required this.placa,
      required this.color,
      required this.modelFontSize,
      required this.plateFontSize,
      required this.iconSize});

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
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OferecerCarona()),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
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
                  widget.marca,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget
                        .modelFontSize, // Use the provided model font size
                  ),
                ),
                Text(
                  widget.placa,
                  style: TextStyle(
                    fontSize: widget
                        .plateFontSize, // Use the provided plate font size
                    height: 1.35,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.directions_car,
              color: _iconColor,
              size: widget.iconSize, // Use the provided icon size
            ),
          ],
        ),
      ),
    );
  }
}