import 'package:flutter/material.dart';

class NewTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color errorTextColor;
  final String? hintText;

  const NewTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.errorTextColor,
    required this.hintText,
  }) : super(key: key);

  @override
  _NewTextFormFieldState createState() => _NewTextFormFieldState();
}

class _NewTextFormFieldState extends State<NewTextFormField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24, 8, 8, 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              keyboardType: widget.keyboardType,
              validator: (value) {
                setState(() {
                  _errorText = widget.validator?.call(value);
                });
                return null;
              },
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
          if (_errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                _errorText!,
                style: TextStyle(
                  color: widget.errorTextColor,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
