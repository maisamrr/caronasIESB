import 'package:flutter/material.dart';

class ClearableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const ClearableTextField({super.key, 
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  _ClearableTextFieldState createState() => _ClearableTextFieldState();
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  bool _showClearIcon = false;
  bool _isFieldFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateClearIconVisibility);
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateClearIconVisibility);
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _updateClearIconVisibility() {
    setState(() {
      _showClearIcon = widget.controller.text.isNotEmpty;
    });
  }

  void _clearTextField() {
    widget.controller.clear();
  }

  void _onFocusChange() {
    setState(() {
      _isFieldFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: !_isFieldFocused ? widget.labelText : null,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            validator: widget.validator,
            onChanged: (_) {
              setState(() {
                _showClearIcon = widget.controller.text.isNotEmpty;
              });
            },
          ),
        ),
        if (_showClearIcon)
          GestureDetector(
            onTap: _clearTextField,
            child: const Icon(
              Icons.close_outlined,
              size: 22,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
