import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color errorTextColor;
  final String? hintText;

  final bool? enabled;
  final TextInputFormatter? format;
  final int? maxLength;

  const NewTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.errorTextColor,
    required this.hintText,
    this.enabled,
    this.format,
    this.maxLength,
  }) : super(key: key);

  @override
  _NewTextFormFieldState createState() => _NewTextFormFieldState();
}

class _NewTextFormFieldState extends State<NewTextFormField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 16, 40, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
            alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  controller: widget.controller,
                  validator: (value) {
                    setState(() {
                      _errorText = widget.validator?.call(value);
                    });
                    return null;
                  },
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.format != null ? [widget.format!] : null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
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
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        '${widget.controller.text.length}/${widget.maxLength}',
                        style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                  ),
              ],
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
