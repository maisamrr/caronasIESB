import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelTextCustom;
  final TextInputType keyboardTypeCustom;
  final Color backgroundColorCustom;

  const CustomTextField({
    Key? key,
    required this.labelTextCustom,
    required this.keyboardTypeCustom,
    required this.backgroundColorCustom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColorCustom,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TextField(
            controller: null,
            keyboardType: keyboardTypeCustom,
            decoration: InputDecoration(
              labelText: labelTextCustom,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
