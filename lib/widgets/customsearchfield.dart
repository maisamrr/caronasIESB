import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;

  const CustomSearchField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: widget.backgroundColor,
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 8.0),
              child: Icon(
                Icons.search,
                size: 22,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
