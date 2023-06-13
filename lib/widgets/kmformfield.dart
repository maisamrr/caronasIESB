import 'package:caronapp/const.dart';
import 'package:flutter/material.dart';

class KmFormField extends FormField<int> {
  final BuildContext context;
  final String labelText;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Function(String)? onSubmitted;

  KmFormField({
    Key? key,
    required this.context,
    required this.labelText,
    required this.keyboardType,
    required this.backgroundColor,
    this.onSubmitted,
    int? initialValue,
    FormFieldSetter<int>? onSaved,
  }) : super(
          key: key,
          initialValue: initialValue ?? 0,
          onSaved: onSaved,
          builder: (FormFieldState<int> state) {
            final TextEditingController controller =
                TextEditingController(text: state.value.toString());
            return Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 40.0, right: 40.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      //LABEL
                      Expanded(
                        child: TextFormField(
                          keyboardType: keyboardType,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: controller,
                          onFieldSubmitted: (value) {/*validar*/},
                        ),
                      ),
                      //ICONE
                      Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: redIdColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '0.0 km',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
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
