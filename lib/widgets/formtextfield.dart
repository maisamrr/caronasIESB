import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;
  final bool? enabled;
  final TextInputFormatter? format;
  final int? maxLength;

  const FormTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
    this.enabled,
    this.format,
    this.maxLength,
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
            alignment: Alignment.centerRight,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  keyboardType: widget.keyboardType,
                  inputFormatters:
                      widget.format != null ? [widget.format!] : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.labelText,
                  ),
                  enabled: widget.enabled ?? true,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                if (widget.maxLength != null)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        '${widget.controller.text.length}/${widget.maxLength}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}