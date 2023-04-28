import 'package:flutter/material.dart';

class CustomNumberInput extends FormField<int> {
  final BuildContext context;
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Function(String)? onSubmitted;

  CustomNumberInput({
    Key? key,
    required this.context,
    required this.labelText,
    required this.keyboardType,
    required this.backgroundColor,
    this.onSubmitted,
    int? initialValue,
    FormFieldSetter<int>? onSaved,
    FormFieldValidator<int>? validator,
  }) : super(
          key: key,
          initialValue: initialValue ?? 0,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<int> state) {
            final TextEditingController _controller =
                TextEditingController(text: state.value.toString());
            return Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          keyboardType: keyboardType,
                          decoration: InputDecoration(
                            labelText: labelText,
                            border: InputBorder.none,
                          ),
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            if (onSubmitted != null) {
                              onSubmitted(value);
                            }
                            state.didChange(int.parse(value));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(
                          Icons.insert_drive_file,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
}
