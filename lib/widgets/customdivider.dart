import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Color color;
  final double thickness;

  const CustomDivider({
    Key? key,
    this.padding = const EdgeInsets.only(left: 48.0, right: 48.0),
    this.color = const Color.fromRGBO(177, 176, 180, 0.612),
    this.thickness = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
}
