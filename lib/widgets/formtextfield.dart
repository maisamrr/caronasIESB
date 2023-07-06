import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;

  const FormTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 40.0, right: 40.0),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.labelText,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}